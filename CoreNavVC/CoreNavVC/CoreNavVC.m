//
//  BaseNavigationComtroller.m
//  通用框架
//
//  Created by muxi on 14-9-12.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import "CoreNavVC.h"
#import "ToolNetWorkView.h"
#import "ToolNetWorkSolveVC.h"
#import "CoreStatus.h"
#import "UIBarButtonItem+Appearance.h"
#import "TipView.h"

@interface CoreNavVC ()

@property (nonatomic,strong) Reachability *readchability;

@property (nonatomic,strong) NSArray *hideNetworkBarControllerArrayFull;                                //这个是最终的读取数组

@property (nonatomic,strong) TipView *tipView;

@property (nonatomic,assign) BOOL isShowedTipViewProperty;

@end

@implementation CoreNavVC


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    //监听网络状态
    [self beginReachabilityNoti];
    
    //背景白色
    self.view.backgroundColor=[UIColor whiteColor];
    
    /** 处理tipView */
    [self handleTipView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tipView.hidden=NO;
    });
}



/** 处理tipView */
-(void)handleTipView{
    
    self.tipView = [TipView tipView];
    
    __weak typeof(self) weakSelf=self;
    
    self.tipView.ClickDismissBtnBlock = ^{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            weakSelf.tipView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [weakSelf.tipView removeFromSuperview];
            
            weakSelf.tipView = nil;
        }];
        
    };
    
    [self.view addSubview:self.tipView];
    
    self.tipView.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views = @{@"tipView":self.tipView};
    
    NSArray *c_H=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tipView]-0-|" options:0 metrics:nil views:views];
    NSArray *c_V=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tipView]-0-|" options:0 metrics:nil views:views];
    [self.view addConstraints:c_H];
    [self.view addConstraints:c_V];
    self.tipView.alpha = 0;
}



#pragma mark  监听网络状态
-(void)beginReachabilityNoti{
    
    Reachability *readchability=[Reachability reachabilityForInternetConnection];
    
    //记录
    self.readchability=readchability;
    
    //开始通知
    [readchability startNotifier];
    
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWorkStatusChange) name:kReachabilityChangedNotification object:readchability];

}



-(void)netWorkStatusChange{
    
    if([self needHideNetWorkBarWithVC:self.topViewController]){
        
        //这里dismiss的原因在于可能由其他页面pop回来的时候，如果直接return会导致bar显示出来。
        [self dismissNetWorkBar];
        return;
    }
    
    if([CoreStatus isNETWORKEnable]){

        [self dismissNetWorkBar];
    }else{

        [self showNetWorkBar];
    }
}


-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    [self netWorkStatusChange];
    
    if(self.viewControllers.count >= 1 ){
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(popAction) image:@"Resource.bundle/navBack" highImage:@"Resource.bundle/navBackHL"];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        [self checkShowedTipView];
    }
    
    [super pushViewController:viewController animated:animated];

}

/** 检查是否显示过了tipView */
-(void)checkShowedTipView{
    
    if (!self.isShowedTipViewProperty) {
        
        static NSString *const tipViewKey = @"TipViewKey";
        
        BOOL isShowed = [[NSUserDefaults standardUserDefaults] boolForKey:tipViewKey];

        if(!isShowed){
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.5 animations:^{
                    self.tipView.alpha = 1;
                }];
            });
            
            //保存key
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:tipViewKey];
            
            self.isShowedTipViewProperty = YES;
        }
    }
}




-(UIViewController *)popViewControllerAnimated:(BOOL)animated{

    UIViewController *vc = [super popViewControllerAnimated:animated];
    
    //再次检查当前控制器是否需要显示网络状态提示视图
    [self netWorkStatusChange];

    if (self.viewControllers.count >= 1){
        self.hidesBottomBarWhenPushed = YES;
    }
    
    return vc;
}

-(void)popAction{
    [self popViewControllerAnimated:YES];
}



#pragma mark  屏幕旋转
-(NSUInteger)supportedInterfaceOrientations{
    return self.topViewController.supportedInterfaceOrientations;
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

    [self netWorkStatusChange];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];

    [self netWorkStatusChange];
}


#pragma mark  显示网络状态提示条
-(void)showNetWorkBar{
    
    CGFloat y = self.navigationBar.frame.size.height + 20.0f;
    
    [ToolNetWorkView showNetWordNotiInViewController:self y:y];
}

#pragma mark  隐藏网络状态提示条
-(void)dismissNetWorkBar{
    [ToolNetWorkView dismissNetWordNotiInViewController:self];
}



-(BOOL)needHideNetWorkBarWithVC:(UIViewController *)vc{
    NSString *vcStr=NSStringFromClass(vc.class);
    BOOL res = [self.hideNetworkBarControllerArrayFull containsObject:vcStr];

    return res;
}

-(NSArray *)hideNetworkBarControllerArrayFull{
    
    if(!_hideNetworkBarControllerArrayFull){
        NSMutableArray *arrayM=[NSMutableArray arrayWithArray:self.hideNetworkBarControllerArray];
        [arrayM addObject:NSStringFromClass([ToolNetWorkSolveVC class])];
        _hideNetworkBarControllerArrayFull=[arrayM copy];
    }
    return _hideNetworkBarControllerArrayFull;
}





@end

//
//  CoreNavVC+LifeFunc.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CoreNavVC+LifeFunc.h"
#import "CoreNavVC+Reachability.h"
#import "CoreNavVC+TipView.h"

@implementation CoreNavVC (LifeFunc)



-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    //监听网络状态
    [self beginReachabilityNoti];
    
    //背景
    self.view.backgroundColor=[UIColor clearColor];
    
    /** 处理tipView */
    [self handleTipView];
    
    [self netWorkStatusChange];
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if(self.navBgView != nil) return;
    
    [self findBgView];
}


#pragma mark  屏幕旋转
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return self.topViewController.supportedInterfaceOrientations;
}

-(void)findBgView{
    
    UIView *bgView = nil;
    
    for (UIView *subView in self.navigationBar.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {bgView = subView;}
    }
    
    self.navBgView = bgView;
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self netWorkStatusChange];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    [self netWorkStatusChange];
}

@end

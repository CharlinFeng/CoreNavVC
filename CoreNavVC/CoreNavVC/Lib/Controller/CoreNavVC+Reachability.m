//
//  CoreNavVC+Reachability.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CoreNavVC+Reachability.h"
#import "CoreStatus.h"
#import "ToolNetWorkView.h"
#import "ToolNetWorkSolveVC.h"

@implementation CoreNavVC (Reachability)

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


/** 网络状态变更 */
-(void)netWorkStatusChange{
    
    if([self needHideNetWorkBarWithVC:self.topViewController]){
        
        //这里dismiss的原因在于可能由其他页面pop回来的时候，如果直接return会导致bar显示出来。
        [self dismissNetWorkBar];
        return;
    }
    
    if([CoreStatus isNetworkEnable]){
        
        [self dismissNetWorkBar];
        
    }else{
        
        [self showNetWorkBar];
    }
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



@end

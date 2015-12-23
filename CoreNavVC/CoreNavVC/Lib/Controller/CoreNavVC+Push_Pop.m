//
//  CoreNavVC+Push_Pop.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CoreNavVC+Push_Pop.h"
#import "CoreNavVC+Reachability.h"
#import "CoreNavVC+TipView.h"
#import "UIBarButtonItem+Appearance.h"



@implementation CoreNavVC (Push_Pop)


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if(self.viewControllers.count >= 1){
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(popAction) image:@"CoreNavVC.bundle/return" highImage:@"CoreNavVC.bundle/return_hl"];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count >= 1) {
        
        [self checkShowedTipView];
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


@end

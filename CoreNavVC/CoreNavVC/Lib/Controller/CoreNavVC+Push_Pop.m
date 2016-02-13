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
#import "UIViewController+Pop.h"
#import "RotationAnimatedTransitioning.h"


@interface CoreNavVC ()<UINavigationControllerDelegate>

@end


@implementation CoreNavVC (Push_Pop)


-(void)customPushPopPrepare{

    self.delegate = self;
}


/** 自定义转场动画 */
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
 
    if(
       
       [fromVC conformsToProtocol:@protocol(RotationAnimatedTransitioningProtocol)]
       &&
       [toVC conformsToProtocol:@protocol(RotationAnimatedTransitioningProtocol)]
       
       ){
        
        return self.at;
        
    }else if(
             
             [fromVC conformsToProtocol:@protocol(PinterestAnimatedTransitioningProtocol)]
             &&
             [toVC conformsToProtocol:@protocol(PinterestAnimatedTransitioningProtocol)]
             
             ){
        
        return self.pt;
        
    }else if(
             
             [fromVC conformsToProtocol:@protocol(ShapeLayerAnimatedTransitioningProtocol)]
             &&
             [toVC conformsToProtocol:@protocol(ShapeLayerAnimatedTransitioningProtocol)]
             
             ){
        
        return self.st;
    }else if(
             
             [fromVC conformsToProtocol:@protocol(FlipAnimatedTransitioningProtocol)]
             &&
             [toVC conformsToProtocol:@protocol(FlipAnimatedTransitioningProtocol)]
             
             ){
        
        return self.ft;
    }
        
    return nil;
}



















-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    self.navType = NavTypePush;
    
    if(self.viewControllers.count >= 1){
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem customItemWithTarget:self action:@selector(popAction) image:@"CoreNavVC.bundle/return" highImage:@"CoreNavVC.bundle/return_hl"];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count > 1) {
        
        [self checkShowedTipView];
    }
}





-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    self.navType = NavTypePop;
    
    UIViewController *vc = [super popViewControllerAnimated:animated];
    
    //再次检查当前控制器是否需要显示网络状态提示视图
    [self netWorkStatusChange];
    
    if (self.viewControllers.count >= 1){
        self.hidesBottomBarWhenPushed = YES;
    }
    
    return vc;
}

-(void)popAction{
    
    __weak UIViewController *vc = self.topViewController;
    
    if(vc.popActionKeeper.PopAction != nil){vc.popActionKeeper.PopAction();return;}
    
    if(self.topViewController.disablePopFunction) return;
    [self popViewControllerAnimated:YES];
}


@end

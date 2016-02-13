//
//  RotationAnimatedTransitioning.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "RotationAnimatedTransitioning.h"
#import "CoreNavVC.h"


@implementation RotationAnimatedTransitioning



-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 1;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    CoreNavVC *navVC = (CoreNavVC *)self.navVC;
    
    UIViewController<RotationAnimatedTransitioningProtocol> * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<RotationAnimatedTransitioningProtocol> * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    
    fromVc.view.frame = finalFrameForVc;
    toVc.view.frame = finalFrameForVc;
    
    BOOL isPush = navVC.navType == NavTypePush;
    
    
    if(isPush){
        [[transitionContext containerView] addSubview:fromVc.view];
        [[transitionContext containerView] addSubview:toVc.view];
        
        
        
    }else{
        [[transitionContext containerView] addSubview:toVc.view];
        [[transitionContext containerView] addSubview:fromVc.view];
    }
    
    
    CGPoint anchorPoint = CGPointZero;
    CGFloat isClockWise = NO;
    if([fromVc respondsToSelector:@selector(RotationAnimatedTransitioningProtocol_anchorPoint)]){
        
        anchorPoint = [fromVc RotationAnimatedTransitioningProtocol_anchorPoint];
    }
    
    if([fromVc respondsToSelector:@selector(RotationAnimatedTransitioningProtocol_isClockWise)]){
        
        isClockWise = [fromVc RotationAnimatedTransitioningProtocol_isClockWise];
    }
    
    UIView *animView = isPush ? toVc.view : fromVc.view;
    
    [self animWithView:animView anchorPoint:anchorPoint isClockWise:isClockWise isPush:isPush completeAction:^{
        
        [transitionContext completeTransition:YES];
    }];
}

-(void)animWithView:(UIView *)animView anchorPoint:(CGPoint)anchorPoint isClockWise:(BOOL)isClockWise isPush:(BOOL)isPush completeAction:(void(^)())completeAction{
    
    animView.layer.anchorPoint =  anchorPoint;
    CGRect bounds = [[UIScreen mainScreen] bounds];
    animView.layer.position = CGPointMake(bounds.size.width * anchorPoint.x, bounds.size.height * anchorPoint.y);
    
    NSInteger i = isClockWise ? -1 : 1;
    
    CGAffineTransform tranform_begin = isPush ? CGAffineTransformMakeRotation(M_PI_4 * 2 * i) : CGAffineTransformIdentity;
    
    CGAffineTransform tranform_end = isPush ? CGAffineTransformIdentity : CGAffineTransformMakeRotation(M_PI_2 * i);
    
    animView.transform = tranform_begin;
    
    NSTimeInterval duration = [self transitionDuration:nil];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        animView.transform = tranform_end;
    } completion:^(BOOL finished) {
        if(completeAction != nil) completeAction();
        if(isPush) return;
        [animView removeFromSuperview];
    }];
    
}




@end

//
//  FlipAnimatedTransitioning.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "FlipAnimatedTransitioning.h"
#import "CoreNavVC.h"

@interface FlipAnimatedTransitioning ()

@property (nonatomic,strong) UIView *v1,*v2;

@end

@implementation FlipAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    CoreNavVC *navVC = (CoreNavVC *)self.navVC;
    
    UIView *containerView = [transitionContext containerView];
    
    UIViewController<FlipAnimatedTransitioningProtocol> * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<FlipAnimatedTransitioningProtocol> * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    CGFloat finalWidth = finalFrameForVc.size.width;
    CGFloat finalHeight = finalFrameForVc.size.height;
    
    fromVc.view.frame = finalFrameForVc;
    toVc.view.frame = finalFrameForVc;
    
    BOOL isPush = navVC.navType == NavTypePush;
    BOOL isVerti = (isPush ? fromVc : toVc).view.tag == 0;
    
    __weak UIView *animView = nil;
    
    CGFloat item1_x = finalFrameForVc.origin.x;
    CGFloat item1_y = finalFrameForVc.origin.y;
    CGFloat item1_w = isVerti ? finalWidth : finalWidth * 0.5f;
    CGFloat item1_h = isVerti ? finalHeight * 0.5f : finalHeight;
    CGRect item1Frame = CGRectMake(item1_x, item1_y, item1_w, item1_h);
    
    CGAffineTransform transform_Item1_from = CGAffineTransformIdentity;
    CGAffineTransform transform_Item1_to = CGAffineTransformIdentity;
    CGAffineTransform transform_Item2_from = CGAffineTransformIdentity;
    CGAffineTransform transform_Item2_to = CGAffineTransformIdentity;
    
    if(isPush){
        
        
        [containerView addSubview:fromVc.view];
        [containerView addSubview:toVc.view];
        
        animView = fromVc.view;
        transform_Item1_from = CGAffineTransformIdentity;
        transform_Item1_to = isVerti ? CGAffineTransformMakeTranslation(0, -item1_h) : CGAffineTransformMakeTranslation(-item1_w, 0);
        transform_Item2_from = CGAffineTransformIdentity;
        transform_Item2_to = isVerti ? CGAffineTransformMakeTranslation(0, item1_h) : CGAffineTransformMakeTranslation(item1_w, 0);
        
    }else{
        
        [containerView addSubview:toVc.view];
        [containerView addSubview:fromVc.view];
        
        animView = toVc.view;
        
        transform_Item1_from = isVerti ? CGAffineTransformMakeTranslation(0, -item1_h) : CGAffineTransformMakeTranslation(-item1_w, 0);
        transform_Item1_to = CGAffineTransformIdentity;
        transform_Item2_from = isVerti ? CGAffineTransformMakeTranslation(0, item1_h) : CGAffineTransformMakeTranslation(item1_w, 0);
        transform_Item2_to = CGAffineTransformIdentity;
    }
    
    //先做上下切割
    
    if(isPush){
        UIView *item1ItemView = [animView resizableSnapshotViewFromRect:item1Frame afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
        item1ItemView.frame = item1Frame;
        self.v1 = item1ItemView;
    }
    [containerView addSubview:self.v1];
    
    if(isPush){
        CGRect item2Frame = isVerti ? CGRectMake(item1_x, item1_h, item1_w, item1_h) : CGRectMake(item1_w, item1_y, item1_w, item1_h);
        UIView *item2ItemView = [animView resizableSnapshotViewFromRect:item2Frame afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
        item2ItemView.frame = item2Frame;
        self.v2 = item2ItemView;
    }
    
    [containerView addSubview:self.v2];
    
    //执行动画
    NSTimeInterval duratioin = [self transitionDuration:nil];
    self.v1.transform = transform_Item1_from;
    self.v2.transform = transform_Item2_from;
    [UIView animateWithDuration:duratioin animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.v1.transform = transform_Item1_to;
        self.v2.transform = transform_Item2_to;
    } completion:^(BOOL finished) {
        self.v1.transform = CGAffineTransformIdentity;
        self.v2.transform = CGAffineTransformIdentity;
        [self.v1 removeFromSuperview];
        [self.v2 removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    //    [UIView animateWithDuration:duratioin delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
    //
    //        item1ItemView.transform = transform_Item1_to;
    //        item2ItemView.transform = transform_Item2_to;
    //
    //    } completion:^(BOOL finished) {
    //
    //        item1ItemView.transform = CGAffineTransformIdentity;
    //        item2ItemView.transform = CGAffineTransformIdentity;
    //        [item1ItemView removeFromSuperview];
    //        [item2ItemView removeFromSuperview];
    //        [transitionContext completeTransition:YES];
    //    }];
}

@end

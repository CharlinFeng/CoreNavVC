//
//  PinterestAnimatedTransitioning.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "PinterestAnimatedTransitioning.h"
#import "CoreNavVC.h"

@implementation PinterestAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 1;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    CoreNavVC *navVC = (CoreNavVC *)self.navVC;
    
    UIView *containerView = [transitionContext containerView];
    
    UIViewController<PinterestAnimatedTransitioningProtocol> * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<PinterestAnimatedTransitioningProtocol> * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    
    fromVc.view.frame = finalFrameForVc;
    toVc.view.frame = finalFrameForVc;
    
    BOOL isPush = navVC.navType == NavTypePush;
    
    
    if(isPush){
        
        
        [containerView addSubview:fromVc.view];
        [containerView addSubview:toVc.view];
        
        
        
    }else{
        
        [[transitionContext containerView] addSubview:toVc.view];
//        [[transitionContext containerView] addSubview:fromVc.view];
    }
    
    //起点view
    UIView *startView = [fromVc PinterestAnimatedTransitioningProtocol_PinterestView];
    //终点view
    UIView *endView = [toVc PinterestAnimatedTransitioningProtocol_PinterestView];
    
    UIImageView *sourceImageView_temp = nil;
    
    
    if([startView isKindOfClass:[UIImageView class]]){
        
        UIImageView *imageView_Source = (UIImageView *)startView;
    
        sourceImageView_temp = [[UIImageView alloc] init];
        
        //设置frame
        sourceImageView_temp.frame = [startView convertRect:startView.bounds toView:nil];
        
        //设置image
        sourceImageView_temp.image = imageView_Source.image;
        
        //统一配置
        sourceImageView_temp.contentMode = imageView_Source.contentMode;
        sourceImageView_temp.backgroundColor = imageView_Source.backgroundColor;
        
    }else{
    
        
        sourceImageView_temp = nil;
    }
    
    //添加
    [containerView addSubview:sourceImageView_temp];
    
    //准备开始动画
    //目标frame
    CGRect destinationFrame = CGRectZero;
    
    if(isPush){
    
        destinationFrame = [toVc PinterestAnimatedTransitioningProtocol_DestinationConvertToWindowFrame];
        
    }else{
    
        destinationFrame = [endView convertRect:endView.bounds toView:nil];
    }
    
    //开始动画
    //隐藏原视图
    startView.hidden = YES;
    endView.hidden = YES;
    toVc.view.alpha = 0;
    
    NSTimeInterval duration = [self transitionDuration:nil];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        sourceImageView_temp.frame = destinationFrame;
        toVc.view.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        startView.hidden = NO;
        endView.hidden = NO;
        [sourceImageView_temp removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
}



@end

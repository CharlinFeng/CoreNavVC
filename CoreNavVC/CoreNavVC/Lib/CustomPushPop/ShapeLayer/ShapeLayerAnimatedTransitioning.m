//
//  ShapeLayerAnimatedTransitioning.m
//  CoreNavVC
//
//  Created by 邓娟 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "ShapeLayerAnimatedTransitioning.h"
#import "CoreNavVC.h"


@interface ShapeLayerAnimatedTransitioning ()

@property (nonatomic,strong) id<UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic,strong) UIView *blurView;

@end

@implementation ShapeLayerAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.72;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //记录
    self.transitionContext = transitionContext;
    
    CoreNavVC *navVC = (CoreNavVC *)self.navVC;
    
    BOOL isPush = navVC.navType == NavTypePush;
    
    UIView *containerView = [transitionContext containerView];
    
    UIViewController<ShapeLayerAnimatedTransitioningProtocol> * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<ShapeLayerAnimatedTransitioningProtocol> * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];

    
    fromVc.view.frame = finalFrameForVc;
    toVc.view.frame = finalFrameForVc;
    self.blurView.frame = finalFrameForVc;
    
    
    //转化frame
    CGRect sourceView_Frame = CGRectZero;
    
    UIBezierPath *fromPath = nil;
    UIBezierPath *toPath = nil;
    
    //获取sourceView
    __weak UIView *sourceView = nil;
    __weak UIView *animView = nil;
    __weak UIView *otherView = nil;
    
    CGFloat alpha_from = 0;
    CGFloat alpha_to = 0;
    CGFloat alpha_blur_from = 0;
    CGFloat alpha_blur_to = 0;
    CGAffineTransform tranfrom_from = CGAffineTransformIdentity;
    CGAffineTransform tranfrom_to = CGAffineTransformIdentity;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat screenW = screenSize.width;
    CGFloat screenH = screenSize.height;
    
    CGFloat p = 1;
    if(isPush){
    
        if([fromVc respondsToSelector:@selector(ShapeLayerAnimatedTransitioningProtocol_MaxRadius_p)]){
        
            p = [fromVc ShapeLayerAnimatedTransitioningProtocol_MaxRadius_p];
        }
    }
    
    CGFloat maxRadius = sqrtf(screenW * screenW + screenH * screenH) * p;

    
    if(isPush){
        
        [containerView addSubview:fromVc.view];
        [containerView addSubview:self.blurView];
        [containerView addSubview:toVc.view];
        
        sourceView = [fromVc ShapeLayerAnimatedTransitioningProtocol_SouceView];
        sourceView_Frame = [sourceView convertRect:sourceView.bounds toView:nil];
        
        animView = toVc.view;
        otherView = fromVc.view;
        
        alpha_from = 1;
        alpha_to = 0.8;
        alpha_blur_from = 0;
        alpha_blur_to = 1;
        tranfrom_from = CGAffineTransformIdentity;
        tranfrom_to = CGAffineTransformMakeScale(4, 4);

        
        if(sourceView.layer.cornerRadius == 0){
            
            fromPath = [UIBezierPath bezierPathWithRect:sourceView_Frame];
            
            toPath = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
            
        }else{
            
            CGFloat wh = sourceView_Frame.size.width;
            
            CGFloat centerX = sourceView_Frame.origin.x + wh * 0.5;
            CGFloat centerY = sourceView_Frame.origin.y + wh * 0.5;
            CGPoint center = CGPointMake(centerX, centerY);
            
            fromPath = [UIBezierPath bezierPathWithArcCenter:center radius:wh*0.5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            toPath = [UIBezierPath bezierPathWithArcCenter:center radius:maxRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        }
        
        
    }else{
        
        sourceView = [toVc ShapeLayerAnimatedTransitioningProtocol_SouceView];
        sourceView_Frame = [sourceView convertRect:sourceView.frame toView:nil];
        [[transitionContext containerView] addSubview:toVc.view];
        [containerView addSubview:self.blurView];
        [[transitionContext containerView] addSubview:fromVc.view];
        
        animView = fromVc.view;
        otherView = toVc.view;
        
        alpha_from = 0.8;
        alpha_to = 1;
        alpha_blur_from = 1;
        alpha_blur_to = 0;
        
        tranfrom_from = CGAffineTransformMakeScale(4, 4);
        tranfrom_to = CGAffineTransformIdentity;
        
        if(sourceView.layer.cornerRadius == 0){
            
            fromPath = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
            toPath = [UIBezierPath bezierPathWithRect:sourceView_Frame];
            
        }else{
            
            CGFloat wh = sourceView_Frame.size.width;
            
            CGFloat centerX = sourceView_Frame.origin.x + wh * 0.5;
            CGFloat centerY = sourceView_Frame.origin.y + wh * 0.5;
            CGPoint center = CGPointMake(centerX, centerY);
            
            fromPath = [UIBezierPath bezierPathWithArcCenter:center radius:maxRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
            toPath = [UIBezierPath bezierPathWithArcCenter:center radius:wh*0.5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        }
    }
    
    
    
    
    //创建一个在sourceView_Frame所指位置的ShapeLayer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = fromPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    
    animView.layer.mask = shapeLayer;
    
    CABasicAnimation *pathAnim = [CABasicAnimation animationWithKeyPath:@"path"];
    NSTimeInterval duration = [self transitionDuration:nil];
    pathAnim.toValue = (__bridge id _Nullable)(toPath.CGPath);
    pathAnim.duration = [self transitionDuration:nil];
    pathAnim.repeatCount = 1;
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pathAnim.delegate = self;
    pathAnim.fillMode = kCAFillModeForwards;
    pathAnim.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnim forKey:@"pathAnim"];
    
    //执行补充动画
//    otherView.alpha = alpha_from;
//    otherView.transform = tranfrom_from;
    self.blurView.alpha = alpha_blur_from;
    [UIView animateWithDuration:duration animations:^{
        
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
//        otherView.alpha = alpha_to;
//        otherView.transform = tranfrom_to;
        self.blurView.alpha = alpha_blur_to;
    }];
    
    if(!isPush){
    
        if([toVc respondsToSelector:@selector(ShapeLayerAnimatedTransitioningProtocol_WillPop)]){
            [toVc ShapeLayerAnimatedTransitioningProtocol_WillPop];
        }
    }
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    UIViewController<ShapeLayerAnimatedTransitioningProtocol> * fromVc = [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<ShapeLayerAnimatedTransitioningProtocol> * toVc = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //防止反弹
    self.blurView.alpha = 0;
    [self.blurView removeFromSuperview];
    fromVc.view.transform = CGAffineTransformIdentity;
    toVc.view.transform = CGAffineTransformIdentity;
    [toVc.view.layer.mask removeFromSuperlayer];
    toVc.view.layer.mask = nil;
    [fromVc.view.layer removeAllAnimations];
    [toVc.view.layer removeAllAnimations];
    
    [self.transitionContext completeTransition:YES];
    
    CoreNavVC *navVC = (CoreNavVC *)self.navVC;
    
    BOOL isPush = navVC.navType == NavTypePush;
    
    if(!isPush){
        
        if([toVc respondsToSelector:@selector(ShapeLayerAnimatedTransitioningProtocol_DidPop)]){
            [toVc ShapeLayerAnimatedTransitioningProtocol_DidPop];
        }
    }
}


-(UIView *)blurView{

    if(_blurView == nil){
    
        if([UIDevice currentDevice].systemVersion.floatValue >= 8.0){
        
            
            UIVisualEffectView *v = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
            _blurView = v;
            
        }else{
        
            UIToolbar *toolBar = [[UIToolbar alloc] init];
            toolBar.barStyle = UIBarStyleBlack;
            _blurView = toolBar;
            
        }
        
    }

    return _blurView;
}

@end

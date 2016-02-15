//
//  PinterestAnimatedTransitioning.h
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol ShapeLayerAnimatedTransitioningProtocol <NSObject>

@optional
-(UIView *)ShapeLayerAnimatedTransitioningProtocol_SouceView;
-(CGFloat)ShapeLayerAnimatedTransitioningProtocol_MaxRadius_p;
-(void)ShapeLayerAnimatedTransitioningProtocol_WillPop;
-(void)ShapeLayerAnimatedTransitioningProtocol_DidPop;

@end


@interface ShapeLayerAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) UINavigationController *navVC;

@end
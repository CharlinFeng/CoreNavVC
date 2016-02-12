//
//  PinterestAnimatedTransitioning.h
//  CoreNavVC
//
//  Created by 邓娟 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol ShapeLayerAnimatedTransitioningProtocol <NSObject>

@required
-(UIView *)ShapeLayerAnimatedTransitioningProtocol_SouceView;
@optional
-(CGFloat)ShapeLayerAnimatedTransitioningProtocol_MaxRadius_p;
-(void)ShapeLayerAnimatedTransitioningProtocol_WillPop;
-(void)ShapeLayerAnimatedTransitioningProtocol_DidPop;

@end


@interface ShapeLayerAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) UINavigationController *navVC;

@end
//
//  RotationAnimatedTransitioning.h
//  CoreNavVC
//
//  Created by 邓娟 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RotationAnimatedTransitioningProtocol <NSObject>

@optional
-(CGPoint)RotationAnimatedTransitioningProtocol_anchorPoint;
-(BOOL)RotationAnimatedTransitioningProtocol_isClockWise;

@end


@interface RotationAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) UINavigationController *navVC;

@end

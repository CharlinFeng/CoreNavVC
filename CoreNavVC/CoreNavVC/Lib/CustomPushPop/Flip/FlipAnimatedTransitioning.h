//
//  PinterestAnimatedTransitioning.h
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol FlipAnimatedTransitioningProtocol <NSObject>

@required
-(UIView *)FlipAnimatedTransitioningProtocol_PinterestView;
-(CGRect)FlipAnimatedTransitioningProtocol_DestinationConvertToWindowFrame;

@end


@interface FlipAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) UINavigationController *navVC;

@end
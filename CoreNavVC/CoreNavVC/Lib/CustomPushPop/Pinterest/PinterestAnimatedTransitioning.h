//
//  PinterestAnimatedTransitioning.h
//  CoreNavVC
//
//  Created by 邓娟 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol PinterestAnimatedTransitioningProtocol <NSObject>

@required
-(UIView *)PinterestAnimatedTransitioningProtocol_PinterestView;
-(CGRect)PinterestAnimatedTransitioningProtocol_DestinationConvertToWindowFrame;

@end


@interface PinterestAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,weak) UINavigationController *navVC;

@end
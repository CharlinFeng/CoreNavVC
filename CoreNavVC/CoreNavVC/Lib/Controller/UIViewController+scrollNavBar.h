//
//  UIViewController+scrollMeau.h
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCPopView.h"

@interface UIViewController (scrollNavbar)

@property (nonatomic,weak) UIView *popView;

@property (nonatomic,strong) UIView *nav_topView;


/** 展示一个PopView */
-(void)showPopView:(UIView *)view;

/** 添加滚动效果: 创建的topview不需要指定frame，内部算 */
-(void)addScrollNavbarWithScrollView:(UIScrollView *)scrollView autoToggleNavbarHeight:(CGFloat)autoToggleNavbarHeight originHeight:(CGFloat)originHeight;

/** 移除滚动效果 */
-(void)removeScrollNavbarWithScrollView:(UIScrollView *)scrollView;


-(void)popGestureEnable:(BOOL)enable;


@end

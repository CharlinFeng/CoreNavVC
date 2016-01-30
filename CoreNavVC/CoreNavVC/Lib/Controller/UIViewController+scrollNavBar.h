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

@property (nonatomic,strong) UIView *nav_topView;

@property (nonatomic,assign) BOOL enableParallax;

@property (nonatomic,assign) BOOL isViewDidAppear;



/** 添加滚动效果: 创建的topview不需要指定frame，内部算 */
-(void)addScrollNavbarWithScrollView:(UIScrollView *)scrollView autoToggleNavbarHeight:(CGFloat)autoToggleNavbarHeight originHeight:(CGFloat)originHeight;

/** 移除滚动效果 */
-(void)removeScrollNavbarWithScrollView:(UIScrollView *)scrollView;




@end

//
//  UINavigationController+Plus.h
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Plus)

/** 隐藏导航条 */
-(void)hideNavBarWithAnim:(BOOL)anim;

/** 显示导航条 */
-(void)showNavBarWithAnim:(BOOL)anim;

@end

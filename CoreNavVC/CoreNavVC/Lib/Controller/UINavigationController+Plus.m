//
//  UINavigationController+Plus.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "UINavigationController+Plus.h"
#import "CoreNavVC.h"

@implementation UINavigationController (Plus)

/** 隐藏导航条 */
-(void)hideNavBarWithAnim:(BOOL)anim{

    CoreNavVC *navVC = (CoreNavVC *)self;
    [self setNavigationBarHidden:YES animated:anim];
}

/** 显示导航条 */
-(void)showNavBarWithAnim:(BOOL)anim{
    CoreNavVC *navVC = (CoreNavVC *)self;
    [self setNavigationBarHidden:NO animated:anim];
}

@end

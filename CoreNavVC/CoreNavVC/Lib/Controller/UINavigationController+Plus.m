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
-(void)hideNavBar{

    CoreNavVC *navVC = (CoreNavVC *)self;
    self.navigationBarHidden = YES;
}

/** 显示导航条 */
-(void)showNavBar{
    CoreNavVC *navVC = (CoreNavVC *)self;
    self.navigationBarHidden = NO;
}

@end

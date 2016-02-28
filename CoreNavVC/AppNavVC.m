//
//  AppNavVC.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/19.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "AppNavVC.h"

@interface AppNavVC ()

@end

@implementation AppNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barStyle = UIBarStyleDefault;
//    self.navigationBar.barTintColor = [UIColor redColor];
    [self navBarAppearanceWithBgColor:[UIColor redColor] textColor:[UIColor whiteColor] titleFontPoint:18 itemFontPoint:15];
}


@end

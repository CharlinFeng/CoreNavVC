//
//  ViewController.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/9/5.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CoreNavVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    CoreNavVC *navVC = self.navigationController;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"%@",navVC.navBgView);
        navVC.navBgView.alpha = 0.6;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        navVC.navBgView.alpha = 0.2;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        navVC.navBgView.alpha = 0.;
    });
}


@end

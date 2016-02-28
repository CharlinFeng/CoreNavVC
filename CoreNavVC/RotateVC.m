//
//  RotateVC.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "RotateVC.h"

@interface RotateVC ()

@end

@implementation RotateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGPoint)RotationAnimatedTransitioningProtocol_anchorPoint{

    return CGPointMake(1, 0);
}

-(BOOL)RotationAnimatedTransitioningProtocol_isClockWise{

    return NO;
}



@end

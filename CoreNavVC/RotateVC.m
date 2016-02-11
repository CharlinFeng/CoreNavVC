//
//  RotateVC.m
//  CoreNavVC
//
//  Created by 邓娟 on 16/2/11.
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

    return CGPointMake(0, 1);
}

-(BOOL)RotationAnimatedTransitioningProtocol_isClockWise{

    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  RotationVC.m
//  CoreNavVC
//
//  Created by Charlin on 16/6/19.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "RotationVC.h"

@interface RotationVC ()

@end

@implementation RotationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.extendedLayoutIncludesOpaqueBars = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGPoint)RotationAnimatedTransitioningProtocol_anchorPoint{
    return CGPointMake(1, 1);
}
-(BOOL)RotationAnimatedTransitioningProtocol_isClockWise{
    return YES;
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

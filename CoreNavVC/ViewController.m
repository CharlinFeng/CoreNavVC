//
//  ViewController.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/9/5.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CoreNavVC.h"
#import "VC2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)clickSction:(id)sender {
    VC2 *vc2 = [[VC2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}

-(CGPoint)RotationAnimatedTransitioningProtocol_anchorPoint{

    return CGPointMake(0, 0);
}

-(BOOL)RotationAnimatedTransitioningProtocol_isClockWise{
    return YES;
}




@end

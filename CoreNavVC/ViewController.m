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
#import "ShowVC.h"
#import "RotateVC.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *listImageV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)clickSction:(id)sender {
    VC2 *vc2 = [[VC2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}




- (IBAction)showActioin:(id)sender {


    
    ShowVC *showVC = [[ShowVC alloc] initWithNibName:@"ShowVC" bundle:nil];
    
    [self.navigationController pushViewController:showVC animated:YES];
    
}





-(UIView *)PinterestAnimatedTransitioningProtocol_PinterestView{

    return self.listImageV;
}

@end

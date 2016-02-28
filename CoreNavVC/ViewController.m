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
#import "ShapeLayerDetailVC.h"
#import "CALayer+Transition.h"
#import "FlipVC.h"




@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *listImageV;

@property (weak, nonatomic) IBOutlet UIButton *btn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.btn.layer.cornerRadius = 30;
    self.btn.layer.masksToBounds = YES;
    
    self.view.tag = 1;
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}

- (IBAction)clickSction:(id)sender {
    
    
    
    VC2 *vc2 = [[VC2 alloc] init];
    
}




- (IBAction)showActioin:(id)sender {


    
    ShowVC *showVC = [[ShowVC alloc] initWithNibName:@"ShowVC" bundle:nil];
    
    [self.navigationController pushViewController:showVC animated:YES];
    
}





-(UIView *)PinterestAnimatedTransitioningProtocol_PinterestView{

    return self.listImageV;
}



- (IBAction)shapeLayerAction:(id)sender {
    
    NSLog(@"点击");
    
    ShapeLayerDetailVC *svc = [[ShapeLayerDetailVC alloc] initWithNibName:@"ShapeLayerDetailVC" bundle:nil];

    [self.navigationController pushViewController:svc animated:YES];

}



-(void)ShapeLayerAnimatedTransitioningProtocol_WillPop{

    NSLog(@"将要");
}

-(void)ShapeLayerAnimatedTransitioningProtocol_DidPop{

    NSLog(@"已经");
}

-(UIView *)ShapeLayerAnimatedTransitioningProtocol_SouceView{

    return self.btn;
}

-(CGFloat)ShapeLayerAnimatedTransitioningProtocol_MaxRadius_p{

    return 0.6;
}

- (IBAction)flipAction:(id)sender {
    
    FlipVC *flipVC = [[FlipVC alloc] initWithNibName:@"FlipVC" bundle:nil];
    
    [self.navigationController pushViewController:flipVC animated:YES];
}













@end

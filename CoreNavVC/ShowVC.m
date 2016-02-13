//
//  ShowVC.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/2/11.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "ShowVC.h"

@interface ShowVC ()

@property (weak, nonatomic) IBOutlet UIImageView *detailImageV;


@end

@implementation ShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@,%@",NSStringFromCGRect(self.detailImageV.frame),NSStringFromCGRect([self.detailImageV convertRect:self.detailImageV.bounds toView:nil]));
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    NSLog(@"%@,%@",NSStringFromCGRect(self.detailImageV.frame),NSStringFromCGRect([self.detailImageV convertRect:self.detailImageV.bounds toView:nil]));
}


-(UIView *)PinterestAnimatedTransitioningProtocol_PinterestView{

    return self.detailImageV;
}

-(CGRect)PinterestAnimatedTransitioningProtocol_DestinationConvertToWindowFrame{

    CGFloat h = 128;
    CGFloat w = h*16/9;
    CGFloat y = 80;
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - w)/2;

    return CGRectMake(x, y, w, h);
}

@end

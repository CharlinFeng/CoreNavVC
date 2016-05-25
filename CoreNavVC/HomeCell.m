//
//  HomeCell.m
//  CoreNavVC
//
//  Created by Charlin on 16/5/24.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "HomeCell.h"
#import "AppNavVC.h"

@interface HomeCell ()

@property (weak, nonatomic) IBOutlet UIView *redDot;

@end

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.redDot.layer.cornerRadius = 3;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = YeahColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

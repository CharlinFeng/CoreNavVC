//
//  VCPopView.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "VCPopView.h"
#import "UIView+CoreNavLayout.h"


@implementation VCPopView


+(instancetype)popView{
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (IBAction)btnClickAction:(id)sender {
    if (self.PopActioinBlock != nil) self.PopActioinBlock();
}


@end

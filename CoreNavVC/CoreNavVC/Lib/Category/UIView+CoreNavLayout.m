//
//  UIView+CoreNavLayout.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/1/14.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "UIView+CoreNavLayout.h"

@implementation UIView (CoreNavLayout)

-(void)layout_InSuperView_edgeinsetsZero{
    
    UIView *superView = self.superview;
    
    if (superView == nil) return;

    self.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views = @{@"v":self};
    
    NSArray *c_H=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[v]-0-|" options:0 metrics:nil views:views];
    NSArray *c_V=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[v]-0-|" options:0 metrics:nil views:views];
    [superView addConstraints:c_H];
    [superView addConstraints:c_V];
}

@end

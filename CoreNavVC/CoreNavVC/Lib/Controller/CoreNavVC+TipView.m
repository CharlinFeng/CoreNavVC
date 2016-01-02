//
//  CoreNavVC+TipView.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "CoreNavVC+TipView.h"

@implementation CoreNavVC (TipView)



/** 处理tipView */
-(void)handleTipView{
    
    __weak typeof(self) weakSelf=self;
    
    self.tipView.ClickDismissBtnBlock = ^{
        
        [UIView animateWithDuration:0.5 animations:^{
            
            weakSelf.tipView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [weakSelf.tipView removeFromSuperview];
            
            weakSelf.tipView = nil;
        }];
    };
}


/** 检查是否显示过了tipView */
-(void)checkShowedTipView{
    
    if (!self.isShowedTipViewProperty) {
        
        static NSString *const tipViewKey = @"TipViewKey";
        
        BOOL isShowed = [[NSUserDefaults standardUserDefaults] boolForKey:tipViewKey];

        [self.view addSubview:self.tipView];
        
        self.tipView.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSDictionary *views = @{@"tipView":self.tipView};
        
        NSArray *c_H=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tipView]-0-|" options:0 metrics:nil views:views];
        NSArray *c_V=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tipView]-0-|" options:0 metrics:nil views:views];
        [self.view addConstraints:c_H];
        [self.view addConstraints:c_V];
        
        if(!isShowed){
            
            [UIView animateWithDuration:0.8 animations:^{
                self.tipView.alpha = 1;
            } completion:^(BOOL finished) {
                [self.view endEditing:YES];
            }];
            
            //保存key
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:tipViewKey];
            
            self.isShowedTipViewProperty = YES;
        }
    }
}


@end

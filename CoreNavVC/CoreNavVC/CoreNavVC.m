//
//  BaseNavigationComtroller.m
//  通用框架
//
//  Created by muxi on 14-9-12.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import "CoreNavVC.h"
#import "ToolNetWorkSolveVC.h"
#import "CoreNavVC+TipView.h"
#import "CoreNavVC+Reachability.h"
#import "CoreNavVC+LifeFunc.h"
#import "CoreNavVC+Push_Pop.h"

@interface CoreNavVC ()


@end

@implementation CoreNavVC


-(TipView *)tipView{
    
    if(_tipView == nil){
        
        _tipView = [TipView tipView];
        
        UIView *bgView = nil;
        
        if([UIDevice currentDevice].systemVersion.floatValue >=16.0){
        
            UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
            bgView = blurView;
            
        }else{
            
            UIToolbar *toolBar = [[UIToolbar alloc] init];
            toolBar.barStyle = UIBarStyleBlack;
            bgView = toolBar;
        }
        [bgView addGestureRecognizer:[[UIPanGestureRecognizer alloc] init]];
        [_tipView insertSubview:bgView atIndex:0];
        bgView.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSDictionary *views = @{@"bgView":bgView};
        
        NSArray *c_H=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bgView]-0-|" options:0 metrics:nil views:views];
        NSArray *c_V=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bgView]-0-|" options:0 metrics:nil views:views];
        [_tipView addConstraints:c_H];
        [_tipView addConstraints:c_V];
        
        _tipView.alpha = 0;
    }
    return _tipView;
}



-(NSArray *)hideNetworkBarControllerArrayFull{
    
    if(!_hideNetworkBarControllerArrayFull){
        NSMutableArray *arrayM=[NSMutableArray arrayWithArray:self.hideNetworkBarControllerArray];
        [arrayM addObject:NSStringFromClass([ToolNetWorkSolveVC class])];
        _hideNetworkBarControllerArrayFull=[arrayM copy];
    }
    return _hideNetworkBarControllerArrayFull;
}


@end

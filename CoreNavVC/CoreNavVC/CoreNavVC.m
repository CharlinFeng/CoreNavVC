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
#import "UIView+CoreNavLayout.h"

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
        
        [bgView layout_InSuperView_edgeinsetsZero];
        
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

-(RotationAnimatedTransitioning *)at{

    if(_at == nil){
    
        _at = [[RotationAnimatedTransitioning alloc] init];
        _at.navVC = self;
    }
    
    return _at;
}

-(PinterestAnimatedTransitioning *)pt{

    if(_pt == nil){
    
        _pt = [[PinterestAnimatedTransitioning alloc] init];
        _pt.navVC = self;
    }

    return _pt;
}

-(ShapeLayerAnimatedTransitioning *)st{

    if(_st == nil){
    
        _st = [[ShapeLayerAnimatedTransitioning alloc] init];
        _st.navVC = self;
    }

    return _st;
}

@end

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

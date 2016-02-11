//
//  BaseNavigationComtroller.h
//  通用框架
//
//  Created by muxi on 14-9-12.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+Appearance.h"
#import "TipView.h"
#import "CoreStatus.h"
#import "UINavigationController+Plus.h"
#import "UIViewController+scrollNavbar.h"
#import "UIBarButtonItem+Appearance.h"
#import "UIViewController+Pop.h"
#import "RotationAnimatedTransitioning.h"
#import "PinterestAnimatedTransitioning.h"

typedef enum{
    
    NavTypeNone = 0,
    NavTypePush,
    NavTypePop
    
} NavType;

@interface CoreNavVC : UINavigationController

@property (nonatomic,strong) TipView *tipView;

@property (nonatomic,strong) NSArray *hideNetworkBarControllerArray;                        //此数组内的控制器（名）不会显示无网络提示框

@property (nonatomic,weak) UIView *navBgView;

@property (nonatomic,assign) BOOL isShowedTipViewProperty;

@property (nonatomic,strong) Reachability *readchability;

@property (nonatomic,strong) NSArray *hideNetworkBarControllerArrayFull;                                //这个是最终的读取数组

@property (nonatomic,assign) NavType navType;

@property (nonatomic,strong) RotationAnimatedTransitioning *at;
@property (nonatomic,strong) PinterestAnimatedTransitioning *pt;

@end

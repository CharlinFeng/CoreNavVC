//
//  TipView.h
//  CoreNavVC
//
//  Created by 冯成林 on 15/9/6.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipView : UIView

@property (nonatomic,copy) void (^ClickDismissBtnBlock)();



+(instancetype)tipView;


@end

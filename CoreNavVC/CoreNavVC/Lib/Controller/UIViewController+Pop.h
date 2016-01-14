//
//  UIViewController+Pop.h
//  CoreNavVC
//
//  Created by 冯成林 on 16/1/14.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCPopView.h"

@interface PopActionKeeper : NSObject

@property (nonatomic,copy) void(^PopAction)();

@end

@interface UIViewController (Pop)

@property (nonatomic,weak) VCPopView *popView;

@property (nonatomic,assign) BOOL disablePopFunction;

@property (nonatomic,copy) void(^PopAction)();

/** 模型内部使用对象 */
@property (nonatomic,strong) PopActionKeeper *popActionKeeper;

/** 添加pop返回功能 */
-(void)addPopFunctionWithAnim:(BOOL)anim;

-(void)popGestureEnable:(BOOL)enable;


@end

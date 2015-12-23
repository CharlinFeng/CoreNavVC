//
//  VCPopView.h
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCPopView : UIView

@property (nonatomic,copy) void (^PopActioinBlock)();

+(instancetype)popView;


@end

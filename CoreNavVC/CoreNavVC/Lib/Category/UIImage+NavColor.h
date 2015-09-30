//
//  UIImage+Color.h
//  网易彩票2014MJ版
//
//  Created by 沐汐 on 14-9-13.
//  Copyright (c) 2014年 沐汐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+NavExtend.h"

@interface UIImage (NavColor)

//给我一种颜色，一个尺寸，我给你返回一个UIImage:不透明
+(UIImage *)imageFromContextWithColor:(UIColor *)color;
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;




- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;


@end

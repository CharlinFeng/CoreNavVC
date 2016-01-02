//
//  HeaderTopView.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/1/2.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "HeaderTopView.h"

@implementation HeaderTopView

+(instancetype)topView{

    return [[NSBundle mainBundle] loadNibNamed:@"HeaderTopView" owner:self options:nil].firstObject;
}
@end

//
//  TipView.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/9/6.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "TipView.h"

@implementation TipView

-(void)awakeFromNib{
    
    [super awakeFromNib];
}



+(instancetype)tipView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}


- (IBAction)clickBtn:(id)sender {
    if(self.ClickDismissBtnBlock != nil) self.ClickDismissBtnBlock();
}




@end

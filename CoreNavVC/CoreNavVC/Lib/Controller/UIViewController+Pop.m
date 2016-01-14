//
//  UIViewController+Pop.m
//  CoreNavVC
//
//  Created by 冯成林 on 16/1/14.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "UIViewController+Pop.h"
#import "CategoryProperty+CoreNavVC.h"
#import "UINavigationController+FDFullscreenPopGesture.h"


@implementation PopActionKeeper



@end



@implementation UIViewController (Pop)

ADD_DYNAMIC_PROPERTY(PopActionKeeper *, popActionKeeper, setPopActionKeeper)


/** 添加pop返回功能 */
-(void)addPopFunctionWithAnim:(BOOL)anim{
    
    if(self.popView != nil) return;
    NSLog(@"---------------");
    //创建一个PopView
    VCPopView *popView = [VCPopView popView];
    
    CGFloat wh = 35;
    CGFloat x = 4.5;
    CGFloat y = 23.8;
    if([UIScreen mainScreen].bounds.size.width > 375) {x = 8; y = 24.5;};
    popView.frame = CGRectMake(x, y, wh, wh);
    
    popView.layer.cornerRadius = wh / 2;
    popView.layer.masksToBounds = YES;
    
    [self.view addSubview:popView];
    
    if(anim){
        
        popView.alpha=0;
        
        [UIView animateWithDuration:0.25 animations:^{
            popView.alpha = 1;
        }];
    }
    
    __weak typeof(self) weakSelf=self;

    popView.PopActioinBlock = self.popActionKeeper.PopAction != nil ? self.PopAction : ^{
        
        if(!self.disablePopFunction){
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    };
    
    self.popView = popView;
}





-(void)popGestureEnable:(BOOL)enable{
    
    self.fd_interactivePopDisabled = !enable;
}






static const char CoreNavCanPopKey = '\0';

-(void)setDisablePopFunction:(BOOL)disablePopFunction{
    
    if(disablePopFunction != self.disablePopFunction){
        
        [self willChangeValueForKey:@"CoreNavCanPopKey"]; // KVO
        
        objc_setAssociatedObject(self, &CoreNavCanPopKey,
                                 @(disablePopFunction), OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"CoreNavCanPopKey"]; // KVO
    }
}

-(BOOL)disablePopFunction{
    return [objc_getAssociatedObject(self, &CoreNavCanPopKey) boolValue];
}

static const char PopViewKey = '\0';

-(void)setPopView:(VCPopView *)popView{
    
    if(popView != self.popView){
        
        [self willChangeValueForKey:@"PopViewKey"]; // KVO
        
        objc_setAssociatedObject(self, &PopViewKey,
                                 popView, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"PopViewKey"]; // KVO
    }
}

-(VCPopView *)popView{
    return objc_getAssociatedObject(self, &PopViewKey);
}

-(void)setPopAction:(void (^)())PopAction{
    

    if(self.popActionKeeper == nil){
    
        self.popActionKeeper = [PopActionKeeper new];
    }
    
    self.popActionKeeper.PopAction = PopAction;

}


-(void (^)())PopAction{

    return self.popActionKeeper.PopAction;
}




@end

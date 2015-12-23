//
//  UIViewController+scrollMeau.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "UIViewController+scrollNavbar.h"
#import <objc/runtime.h>
#import "UINavigationController+Plus.h"
#import "CoreNavVC.h"



static NSString const *ScrollViewKeyPath_CoreNavVC = @"contentOffset";

@implementation UIViewController (scrollNavbar)


static const char PopViewKey = '\0';

-(void)setPopView:(UIView *)popView{

    if(popView != self.popView){

        [self willChangeValueForKey:@"PopViewKey"]; // KVO
        
        objc_setAssociatedObject(self, &PopViewKey,
                                 popView, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"PopViewKey"]; // KVO
    }
}

-(UIView *)popView{
    return objc_getAssociatedObject(self, &PopViewKey);
}


/** 展示一个PopView */
-(void)showPopView:(UIView *)view{
    
    if(self.popView != nil) return;
    
    //创建一个PopView
    VCPopView *popView = [VCPopView popView];
    
    CGFloat wh = 35;
    CGFloat x = 4.5;
    CGFloat y = 23.8;
    if([UIScreen mainScreen].bounds.size.width > 375) {x = 8; y = 24.5;};
    popView.frame = CGRectMake(x, y, wh, wh);
    
    popView.layer.cornerRadius = wh / 2;
    popView.layer.masksToBounds = YES;
    
    [view addSubview:popView];
    
    __weak typeof(self) weakSelf=self;
    
    popView.PopActioinBlock = ^{
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    self.popView = popView;
    
}


/** 添加滚动效果 */
-(void)addScrollNavbarWithScrollView:(UIScrollView *)scrollView{

    [self showPopView:self.view];
    [scrollView addObserver:self forKeyPath:ScrollViewKeyPath_CoreNavVC options:NSKeyValueObservingOptionNew context:nil];
}


/** 移除滚动效果 */
-(void)removeScrollNavbarWithScrollView:(UIScrollView *)scrollView{

    [scrollView removeObserver:self forKeyPath:ScrollViewKeyPath_CoreNavVC];
    [scrollView removeFromSuperview];
    scrollView = nil;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    UIScrollView *scrollView = (UIScrollView *)object;
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat maxOffsetY = 250;
    
    CoreNavVC *navVC = (CoreNavVC *)self.navigationController;
    
    if (offsetY > 50){
    
        CGFloat p = offsetY / maxOffsetY;
    
        [self.navigationController showNavBar];
        
        navVC.navBgView.alpha = p;
        
        self.popView.hidden = p > 0.5;
    }else{
        [self.navigationController hideNavBar];
        navVC.navBgView.alpha = 0;
    }
}




@end

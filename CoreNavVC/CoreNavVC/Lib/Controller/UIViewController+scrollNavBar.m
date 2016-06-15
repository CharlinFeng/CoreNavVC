//
//  UIViewController+scrollMeau.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "UIViewController+scrollNavbar.h"
#import "CoreNavVC.h"
#import "CategoryProperty+CoreNavVC.h"
#import "UIView+CoreNavLayout.h"

@interface UIViewController (scrollNavbar)

@property (nonatomic,strong) NSNumber *topViewOriginHeight, *autoToggleNavbarHeight;

@property (nonatomic,strong) UIView *nav_topContentView;



@end


static NSString const *ScrollViewKeyPath_CoreNavVC = @"contentOffset";

@implementation UIViewController (scrollNavbar)

ADD_DYNAMIC_PROPERTY(NSNumber *, topViewOriginHeight, setTopViewOriginHeight)
ADD_DYNAMIC_PROPERTY(NSNumber *, autoToggleNavbarHeight, setAutoToggleNavbarHeight)
ADD_DYNAMIC_PROPERTY(UIView *, nav_topContentView, setNav_topContentView)

ADD_DYNAMIC_PROPERTY_CGFloat(CGFloat, offsetYP, setOffsetYP)
ADD_DYNAMIC_PROPERTY_CGFloat(CGFloat, parallaxValue, setParallaxValue)



-(void)viewWillAppear_scrollNavbar{
    
    self.isViewDidAppear = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self addPopFunctionWithAnim:YES];
    });
    
    if (self.offsetYP <= 0){self.navigationController.navigationBar.alpha=0;return;}
    if (self.offsetYP >= 1){self.navigationController.navigationBar.alpha=1;return;}
    
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.navigationBar.alpha = 0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.navigationBar.alpha = self.offsetYP;
        }];
    });
}



-(void)viewWillDisappear_scrollNavbar{
    
    self.isViewDidAppear = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
    
        self.navigationController.navigationBar.alpha = 1;
    }];
}



static const char CoreNavTopViewKey = '\0';
-(void)setNav_topView:(UIView *)nav_topView{
    
    if(nav_topView != self.nav_topView){
        
        [self willChangeValueForKey:@"CoreNavTopViewKey"]; // KVO
        
        objc_setAssociatedObject(self, &CoreNavTopViewKey,
                                 nav_topView, OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"CoreNavTopViewKey"]; // KVO
    }
}

-(UIView *)nav_topView{
    return objc_getAssociatedObject(self, &CoreNavTopViewKey);
}









/** 添加滚动效果: 创建的topview不需要指定frame，内部算 */
-(void)addScrollNavbarWithScrollView:(UIScrollView *)scrollView autoToggleNavbarHeight:(CGFloat)autoToggleNavbarHeight originHeight:(CGFloat)originHeight{
  
    NSAssert(self.nav_topView != nil, @"[Charlin Feng]: nav_topView must have value!");
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.autoToggleNavbarHeight = @(autoToggleNavbarHeight);
    self.topViewOriginHeight = @(originHeight);
    
    
    //初始化frame
    self.nav_topContentView = [[UIView alloc] initWithFrame:CGRectMake(0, -originHeight, [UIScreen mainScreen].bounds.size.width, originHeight)];
    
    //嵌套
    [self.nav_topContentView addSubview:self.nav_topView];
    
    //添加约束
    [self.nav_topView layout_InSuperView_edgeinsetsZero];
    
    scrollView.contentInset = UIEdgeInsetsMake(originHeight, 0, 0, 0);
    [scrollView insertSubview:self.nav_topContentView atIndex:0];
    [scrollView addObserver:self forKeyPath:ScrollViewKeyPath_CoreNavVC options:NSKeyValueObservingOptionNew context:nil];
}


/** 移除滚动效果 */
-(void)removeScrollNavbarWithScrollView:(UIScrollView *)scrollView{
    
    CoreNavVC *navVC = (CoreNavVC *)self.navigationController;
    [navVC showNavBarWithAnim:YES];
    [scrollView removeObserver:self forKeyPath:ScrollViewKeyPath_CoreNavVC];
    [scrollView removeFromSuperview];
    scrollView = nil;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
   
    if(!self.isViewDidAppear) {return;}
    
    if (self.nav_topView == nil) {return;}
    
    UIScrollView *scrollView = (UIScrollView *)object;
    
    if(scrollView == nil){return;}
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat maxOffsetY = 250;
    
    CGFloat realOffset = offsetY + self.topViewOriginHeight.floatValue;
    
    
    
    CGFloat p = realOffset / maxOffsetY;
    
    self.offsetYP = p;
    
    CoreNavVC *navVC = (CoreNavVC *)self.navigationController;
    
    navVC.navigationBar.alpha = p;
    self.popView.hidden = NO;

    self.popView.hidden = p > 0.5;

    if (realOffset > maxOffsetY) {return;}
    
    CGFloat parallaxValue_temp = self.parallaxValue;
    if (parallaxValue_temp == 0) {parallaxValue_temp = 120;}
    
    if(offsetY > -self.topViewOriginHeight.floatValue) {
        
        if(self.enableParallax){
            CGRect frame = self.nav_topContentView.frame;
            frame.origin.y = offsetY - p * parallaxValue_temp;
            self.nav_topContentView.frame = frame;
        }
        
    }else {
        
        CGRect frame = self.nav_topContentView.frame;
        CGFloat height = - offsetY;
        frame.size.height = height;
        frame.origin.y = -height;
        self.nav_topContentView.frame = frame;
    }
    
}




static const char CoreNavEnableParallax = '\0';

-(void)setEnableParallax:(BOOL)enableParallax{
    
    if(enableParallax != self.enableParallax){
        
        [self willChangeValueForKey:@"CoreNavEnableParallax"]; // KVO
        
        objc_setAssociatedObject(self, &CoreNavEnableParallax,
                                 @(enableParallax), OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"CoreNavEnableParallax"]; // KVO
    }
}

-(BOOL)enableParallax{
    return [objc_getAssociatedObject(self, &CoreNavEnableParallax) boolValue];
}




static const char CoreNavIsViewDidAppear = '\0';

-(void)setIsViewDidAppear:(BOOL)isViewDidAppear{
    
    if(isViewDidAppear != self.isViewDidAppear){
        
        [self willChangeValueForKey:@"CoreNavIsViewDidAppear"]; // KVO
        
        objc_setAssociatedObject(self, &CoreNavIsViewDidAppear,
                                 @(isViewDidAppear), OBJC_ASSOCIATION_ASSIGN);
        [self didChangeValueForKey:@"CoreNavIsViewDidAppear"]; // KVO
    }
}

-(BOOL)isViewDidAppear{
    return [objc_getAssociatedObject(self, &CoreNavIsViewDidAppear) boolValue];
}

@end

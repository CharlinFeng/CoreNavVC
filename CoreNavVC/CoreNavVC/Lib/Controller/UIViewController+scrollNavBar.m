//
//  UIViewController+scrollMeau.m
//  CoreNavVC
//
//  Created by 冯成林 on 15/12/23.
//  Copyright © 2015年 冯成林. All rights reserved.
//

#import "UIViewController+scrollNavbar.h"
#import "UINavigationController+Plus.h"
#import "CoreNavVC.h"
#import "CategoryProperty+CoreNavVC.h"
#import "UIView+CoreNavLayout.h"

@interface UIViewController (scrollNavbar)

@property (nonatomic,copy) NSNumber *topViewOriginHeight, *autoToggleNavbarHeight;

@property (nonatomic,strong) UIView *nav_topContentView;



@end


static NSString const *ScrollViewKeyPath_CoreNavVC = @"contentOffset";

@implementation UIViewController (scrollNavbar)


ADD_DYNAMIC_PROPERTY(NSNumber *, topViewOriginHeight, setTopViewOriginHeight)
ADD_DYNAMIC_PROPERTY(NSNumber *, autoToggleNavbarHeight, setAutoToggleNavbarHeight)
ADD_DYNAMIC_PROPERTY(UIView *, nav_topContentView, setNav_topContentView)







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
    [scrollView removeObserver:self forKeyPath:ScrollViewKeyPath_CoreNavVC];
    [scrollView removeFromSuperview];
    scrollView = nil;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    if (self.nav_topView == nil) {return;}
    
    UIScrollView *scrollView = (UIScrollView *)object;
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat maxOffsetY = 250;
    
    CoreNavVC *navVC = (CoreNavVC *)self.navigationController;
    
    CGFloat realOffset = offsetY + self.topViewOriginHeight.floatValue;
    
    CGFloat p = realOffset / maxOffsetY;
    
    if (realOffset > self.autoToggleNavbarHeight.floatValue){
    
        [self.navigationController showNavBarWithAnim:NO];
        
        navVC.navBgView.alpha = p;
        
        self.popView.hidden = p > 0.5;
        
    }else{
        
        [self.navigationController hideNavBarWithAnim:NO];
        navVC.navBgView.alpha = 0;
    }
    
    if(offsetY > -self.topViewOriginHeight.floatValue) {

        CGRect frame = self.nav_topContentView.frame;
        CGFloat height = - offsetY;
        frame.origin.y = offsetY - p * 36;
        self.nav_topContentView.frame = frame;
        
    }else {
        
        CGRect frame = self.nav_topContentView.frame;
        CGFloat height = - offsetY;
        frame.size.height = height;
        frame.origin.y = -height;
        self.nav_topContentView.frame = frame;
    }
    
}






@end

//
//  LCPanGestureRecognizer.h
//  PanBackDemo
//
//  Created by clovelu on 5/30/14.
//
//

#import <UIKit/UIKit.h>

@interface LCPanGestureRecognizer : UIPanGestureRecognizer
@property (readonly, nonatomic) UIEvent *event;
- (CGPoint)beganLocationInView:(UIView *)view;
@end

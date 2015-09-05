//
//  LCPanGestureRecognizer.m
//  PanBackDemo
//
//  Created by clovelu on 5/30/14.
//
//

#import "LCPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface LCPanGestureRecognizer ()
@property (assign, nonatomic) CGPoint beganLocation;
@property (strong, nonatomic) UIEvent *event;
@property (assign, nonatomic) NSTimeInterval beganTime;
@end

@implementation LCPanGestureRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.beganLocation = [touch locationInView:self.view];
    self.event = event;
    self.beganTime = event.timestamp;
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.state == UIGestureRecognizerStatePossible && event.timestamp - self.beganTime > 0.3) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    [super touchesMoved:touches withEvent:event];
}

- (void)reset
{
    self.beganLocation = CGPointZero;
    self.event = nil;
    self.beganTime = 0;
    [super reset];
}

- (CGPoint)beganLocationInView:(UIView *)view
{
    return [view convertPoint:self.beganLocation fromView:self.view];
}

@end

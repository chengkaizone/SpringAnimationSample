//
//  ClockView.m
//  SpringAnimationSample
//
//  Created by lance on 15/10/13.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ClockView.h"
#import "easing.h"
#import "YXEasing.h"

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@interface ClockView()

@property (nonatomic, strong) CALayer *secLayer;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ClockView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.layer.borderWidth = 1.f;
    self.layer.cornerRadius = 150.f;
    self.layer.borderColor = [UIColor redColor].CGColor;
    
    CGFloat radius = self.bounds.size.width / 2;
    self.secLayer = [CALayer layer];
    self.secLayer.anchorPoint = CGPointMake(0, 0);
    self.secLayer.frame = CGRectMake(radius, radius, 1, radius);
    self.secLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.layer addSublayer:self.secLayer];
    
}

- (void)start {
    if (self.timer != nil) {
        [self.timer invalidate];
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stop {
    if (self.timer != nil) {
        [self.timer invalidate];
    }
}

- (void)timerEvent {
    
    CGFloat oldValue = DEGREES_TO_RADIANS((360 / 60.f ) * _sec++);
    CGFloat newValue = DEGREES_TO_RADIANS((360 / 60.f ) * _sec);
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    keyFrameAnimation.duration = 0.5f;
    keyFrameAnimation.values = [YXEasing calculateFrameFromValue:oldValue
                                                         toValue:newValue
                                                            func:ElasticEaseOut
                                                      frameCount:0.5 * 30];
    self.secLayer.transform = CATransform3DMakeRotation(newValue, 0, 0, 1);
    
    [self.secLayer addAnimation:keyFrameAnimation forKey:nil];
    
}

@synthesize sec = _sec;
- (void)setSec:(int)sec {
    if(sec < 0){
        sec = 0;
    } else if(sec > 60){
        sec %= 60;
    }
    _sec = sec;
}
- (int)sec {
    return _sec;
}

@end

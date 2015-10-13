//
//  ClockView.h
//  SpringAnimationSample
//
//  Created by lance on 15/10/13.
//  Copyright © 2015年 lance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockView : UIView

@property (nonatomic, assign) int sec;//秒值

- (void)start;

- (void)stop;

@end

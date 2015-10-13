//
//  ViewController.m
//  SpringAnimationSample
//
//  Created by lance on 15/10/13.
//  Copyright © 2015年 lance. All rights reserved.
//

#import "ViewController.h"
#import "easing.h"
#import "YXEasing.h"
#import "ClockView.h"


@interface ViewController ()

@property (nonatomic, strong) CALayer *secLayer;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ClockView *showView = [[ClockView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    showView.center = self.view.center;
    [self.view addSubview:showView];
    
    showView.sec = 0;
    
    [showView start];
    
}



@end

//
//  ViewController.m
//  AnimationButton
//
//  Created by 李艺真 on 16/6/12.
//  Copyright © 2016年 李艺真. All rights reserved.
//

#import "ViewController.h"
#import "YZAnimatButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YZAnimatButton *button =[[YZAnimatButton alloc] initWithNormalImageString:@"normal" highlihgtImageStirng:@"highlight" buttonTouchUpInsideAtion:^(UIButton * button) {
        NSLog(@"button click");
    } visual:YZAnimationVisualExcessive];
    button.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:button];
    
//    
//    CALayer *maskLayer = [CALayer layer];
//    maskLayer.backgroundColor=[UIColor brownColor].CGColor;
//    maskLayer.frame = CGRectMake(100, 300, 100, 50);
//    [self.view.layer addSublayer:maskLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

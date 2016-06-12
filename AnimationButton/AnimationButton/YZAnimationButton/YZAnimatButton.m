//
//  YZAnimatButton.m
//  AnimationButton
//
//  Created by 李艺真 on 16/6/12.
//  Copyright © 2016年 李艺真. All rights reserved.
//

#import "YZAnimatButton.h"
#import "YZAnimationButtonVisual.h"

@interface YZAnimatButton ()
@property (nonatomic, strong) UIImageView *normalImageView;
@property (nonatomic, strong) UIImageView *highlightImageView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) CALayer *maskLayer;
@property (nonatomic, assign) Boolean isAnimating;
@property (nonatomic, copy) ButtonTouchUpInsideAtion buttonTouchUpInsideAtion;
@property (nonatomic, assign) YZAnimationVisual visual;


@end

@implementation YZAnimatButton

- (instancetype)initWithNormalImageString:(NSString *) normalImageStrng
                     highlihgtImageStirng:(NSString *)highlihgtImageStirng
                 buttonTouchUpInsideAtion:(ButtonTouchUpInsideAtion)buttonTouchUpInsideAtion
                                   visual:(YZAnimationVisual)visual;
{
    if (self = [super init]) {
        self.normalImageView.image = [UIImage imageNamed:normalImageStrng];
        self.highlightImageView.image = [UIImage imageNamed:highlihgtImageStirng];
        self.buttonTouchUpInsideAtion = buttonTouchUpInsideAtion;
        self.visual = visual;
        self.alowLongPressAnimation = YES;
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.normalImageView];
        [self addSubview:self.highlightImageView];
        [self addSubview:self.button];
    
        self.highlightImageView.layer.mask = self.maskLayer;
        [self.maskLayer addSublayer:self.maskAnimatLayer];
        [self.button addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (self.alowLongPressAnimation == NO) {
        self.isAnimating = NO;
        return;
    }
    
    if (object == self.button) {
        if (self.button.isHighlighted) {
            if (!self.isAnimating) {
                self.isAnimating = YES;
                [self startAnimate];
            }
        } else {
            [self endAnimate];
        }
    }
}

- (void)dealloc {
    [self.button removeObserver:self forKeyPath:@"highlighted"];
}

- (void)layoutSubviews {
    self.normalImageView.frame = self.bounds;
    self.highlightImageView.frame = self.bounds;
    self.button.frame = self.bounds;
    self.maskLayer.frame = self.bounds;
    self.maskAnimatLayer.frame = self.bounds;
    
    // 重新布局图层
    [YZAnimationButtonVisual layoutBlock](self, self.visual);
}

#pragma mark - get/set method
#pragma mark UI
- (UIImageView *)normalImageView {
    if (_normalImageView == nil) {
        _normalImageView = [[UIImageView alloc] init];
        _normalImageView.contentMode = UIViewContentModeCenter;
    }
    return _normalImageView;
}

- (UIImageView *)highlightImageView {
    if (_highlightImageView == nil) {
        _highlightImageView = [[UIImageView alloc] init];
        _highlightImageView.contentMode = UIViewContentModeCenter;
    }
    return _highlightImageView;
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

#pragma mark - Action
- (void)buttonClick:(UIButton *)button {
    if (self.buttonTouchUpInsideAtion != nil) {
        self.buttonTouchUpInsideAtion(self.button);
    }
}

#pragma mark - Private

- (CALayer *)maskLayer {
    if (_maskLayer == nil) {
        _maskLayer = [CALayer layer];
    }
    return _maskLayer;
}

- (CAShapeLayer *)maskAnimatLayer {
    if (_maskAnimatLayer == nil) {
        _maskAnimatLayer = [CAShapeLayer layer];
        _maskAnimatLayer.fillColor = [UIColor greenColor].CGColor; // Any color but clear will be OK
    }
    return _maskAnimatLayer;
   }

- (void) endAnimate {
    [self.maskAnimatLayer removeAllAnimations];
    self.isAnimating = NO;
}

- (void) startAnimate {
    // 启动图层动画
    [YZAnimationButtonVisual animationBlock](self, self.visual);
}

@end

//
//  YZAnimationButtonVisual.m
//  AnimationButton
//
//  Created by 李艺真 on 16/6/12.
//  Copyright © 2016年 李艺真. All rights reserved.
//

#import "YZAnimationButtonVisual.h"
#import "YZAnimatButton.h"

@implementation YZAnimationButtonVisual

+(YZAnimationVisualBlock)animationBlock{
    YZAnimationVisualBlock block = ^(YZAnimatButton * animationButton, YZAnimationVisual visual){
        switch (visual) {
            case YZAnimationVisualScale:
            {
                CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                scaleAnimation.fromValue = [NSNumber numberWithFloat:0.0];
                scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
                scaleAnimation.repeatCount = CGFLOAT_MAX;
                scaleAnimation.duration = 0.5f;
                scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [animationButton.maskAnimatLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
            }
                break;
            case YZAnimationVisualExcessive:
            {
                CGFloat width = animationButton.bounds.size.width;
                    CGFloat height = animationButton.bounds.size.height;
                
                
                    CABasicAnimation *downAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
                    downAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-width, height/2)];
                    downAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(width, height/2)];
                    downAnimation.duration = 1.0;
                    downAnimation.repeatCount = CGFLOAT_MAX;
                    [animationButton.maskAnimatLayer addAnimation:downAnimation forKey:@"downAnimation"];
            }
                break;
                
            default:
                break;
        }
    };
    return block;
}


+(YZAnimationLayoutBlock)layoutBlock{
    YZAnimationLayoutBlock block = ^(YZAnimatButton * animationButton, YZAnimationVisual visual){
        switch (visual) {
            case YZAnimationVisualScale:
            {
                CGFloat radius = MIN(animationButton.frame.size.width, animationButton.frame.size.height) /2;
                
                animationButton.maskAnimatLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(animationButton.frame.size.width/2, animationButton.frame.size.height/2)
                                                                                      radius:radius
                                                                                  startAngle:0
                                                                                    endAngle:2*M_PI
                                                                                   clockwise:YES].CGPath;
                animationButton.maskAnimatLayer.transform = CATransform3DMakeScale(0, 0, 0);
                animationButton.maskAnimatLayer.opacity = 0.8f;
            }
                break;
            case YZAnimationVisualExcessive:
            {
                CGFloat width = animationButton.bounds.size.width;
                CGFloat height = animationButton.bounds.size.height;
                
                UIBezierPath *path = [UIBezierPath bezierPath];
                [path moveToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(width * 2, 0)];
                [path addLineToPoint:CGPointMake(width, height)];
                [path addLineToPoint:CGPointMake(0, height)];
                [path closePath];
                
                animationButton.maskAnimatLayer.frame = CGRectMake(0, 0, width*2, height);
                animationButton.maskAnimatLayer.path = path.CGPath;
                animationButton.maskAnimatLayer.opacity = 0.8f;
                animationButton.maskAnimatLayer.position = CGPointMake(-width, height/2);
            }
                break;
                
            default:
                break;
        }
    };
    return block;
}
@end

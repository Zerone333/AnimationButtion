//
//  YZAnimationButtonVisual.h
//  AnimationButton
//
//  Created by 李艺真 on 16/6/12.
//  Copyright © 2016年 李艺真. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YZAnimatButton;

typedef NS_ENUM(NSInteger,YZAnimationVisual){
    /**
     *  中心缩放效果
     */
    YZAnimationVisualScale = 0,
    /**
     *  渐入效果
     */
    YZAnimationVisualExcessive
};

typedef void (^YZAnimationVisualBlock)(YZAnimatButton *animationButton, YZAnimationVisual visual);
typedef void (^YZAnimationLayoutBlock)(YZAnimatButton *animationButton, YZAnimationVisual visual);

@interface YZAnimationButtonVisual : NSObject

/**
 *  动画效果
 *
 *  @return block
 */
+(YZAnimationVisualBlock)animationBlock;

/**
 *  重新设置动画图层Frame
 *
 *  @return block
 */
+(YZAnimationLayoutBlock)layoutBlock;
@end

//
//  YZAnimatButton.h
//  AnimationButton
//
//  Created by 李艺真 on 16/6/12.
//  Copyright © 2016年 李艺真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZAnimationButtonVisual.h"

typedef void(^ButtonTouchUpInsideAtion)(UIButton *button);
@interface YZAnimatButton : UIView

/**
 *  动画图层
 */
@property (nonatomic, strong) CAShapeLayer *maskAnimatLayer;

/**
 *  是否允许长按动画效果 defaut is 'YES'
 */
@property (nonatomic, assign) BOOL alowLongPressAnimation;

/**
 *  创建自定义按钮视图，带有按钮长按动画效果
 *
 *  @param normalImageStrng         正常按钮图标
 *  @param highlihgtImageStirng     高亮按钮图标
 *  @param buttonTouchUpInsideAtion 按钮点击事件
 *  @param visual                   长按动画效果
 *
 *  @return YZAnimatButton
 */
- (instancetype)initWithNormalImageString:(NSString *) normalImageStrng
highlihgtImageStirng:(NSString *)highlihgtImageStirng
buttonTouchUpInsideAtion:(ButtonTouchUpInsideAtion)buttonTouchUpInsideAtion
                                   visual:(YZAnimationVisual)visual;


@end
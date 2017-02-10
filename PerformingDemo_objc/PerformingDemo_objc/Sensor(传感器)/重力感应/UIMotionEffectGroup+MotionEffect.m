//
//  UIMotionEffectGroup+MotionEffect.m
//  JuxinABS
//
//  Created by Queuey on 2016/11/29.
//  Copyright © 2016年 queuey. All rights reserved.
//

#import "UIMotionEffectGroup+MotionEffect.h"

@implementation UIMotionEffectGroup (MotionEffect)


+ (UIMotionEffectGroup *)motionEffectGroupWithEffectX:(CGFloat)motionEffectX {
	CGFloat motionEffectY = motionEffectX * 1136 / 640;
	
	UIMotionEffectGroup *effectGroup = [[UIMotionEffectGroup alloc] init];
	UIInterpolatingMotionEffect * effectX;
	UIInterpolatingMotionEffect * effectY;
	
	effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
	effectX.minimumRelativeValue = [NSNumber numberWithFloat:-motionEffectX];
	effectX.maximumRelativeValue = [NSNumber numberWithFloat:motionEffectX];
	
	effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
	effectY.minimumRelativeValue = [NSNumber numberWithFloat:-motionEffectY];
	effectY.maximumRelativeValue = [NSNumber numberWithFloat:motionEffectY];
	
	effectGroup.motionEffects = @[effectX, effectY];
	
	return effectGroup;
}


@end

//
//  YGGravityImageView.m
//  mrscorpion
//
//  Created by mrscorpion on 16/6/23.
//  Copyright © 2016年 mrscorpion. All rights reserved.
//

#import "YGGravityImageView.h"
#import "YGGravity.h"

#define SPEED 100

@implementation YGGravityImageView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self configUI];
    }
    return self;
}
- (void)configUI
{
    _myImageView = [[UIImageView alloc]init];
    [self addSubview:_myImageView];
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    _myImageView.image = image;
    [_myImageView sizeToFit];
    _myImageView.frame = CGRectMake(0, 0, self.frame.size.height *(_myImageView.frame.size.width / _myImageView.frame.size.height), self.frame.size.height);
    _myImageView.center = CGPointMake(self.frame.size.width/2,self.frame.size.height/2);
}

- (void)startAnimate
{
	
    [YGGravity sharedGravity].timeInterval = 1.0 / 24;
	
	CGFloat self_Width = self.frame.size.width;
	
	CGFloat imageWidth = _myImageView.frame.size.width;

	CGFloat imageCenterY = _myImageView.center.y;
	
	CGFloat scrollSpeed = (imageWidth - self_Width)/2/SPEED * (imageWidth/[UIScreen mainScreen].bounds.size.width);
	
//    [[YGGravity sharedGravity] startDeviceMotionUpdatesBlock:^(float x, float y, float z) {
    [[YGGravity sharedGravity] startGyroUpdatesBlock:^(float x, float y, float z) {
		if (y > 0.1 || y < -0.1) {
			[UIView animateKeyframesWithDuration:0.1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeDiscrete animations:^{
				
				CGFloat imageX = _myImageView.frame.origin.x;
				
				CGPoint imageCenter;
				if (imageX <= 0 && imageX >= self_Width - imageWidth) {
					float interpretedXOffset = imageX - y * scrollSpeed + imageWidth/2;
					imageCenter = CGPointMake(interpretedXOffset, imageCenterY);
					
				} else if (imageX > 0) {
					
					imageCenter = CGPointMake(imageWidth/2, imageCenterY);
				} else if (imageX < self_Width - imageWidth) {
					
					imageCenter = CGPointMake((self_Width - imageWidth) + imageWidth/2, imageCenterY);
				}
				_myImageView.center = imageCenter;
				
			} completion:nil];
		}
    }];
}

-(void)stopAnimate
{
    [[YGGravity sharedGravity] stop];
}

@end

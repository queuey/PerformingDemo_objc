//
//  GravityViewController.m
//  PerformingDemo_objc
//
//  Created by Queuey on 2017/2/9.
//  Copyright © 2017年 queuey. All rights reserved.
//

#import "GravityViewController.h"
#import "YGGravityImageView.h"
#import "UIMotionEffectGroup+MotionEffect.h"

const CGFloat motionEffectX = 20;

@interface GravityViewController ()
//背景图
@property(nonatomic, strong) YGGravityImageView *backgroundImageView;

@property(nonatomic, strong) UIImageView *motionImageView;

@end


@implementation GravityViewController


#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];

//	[self.view addSubview:self.backgroundImageView];
	
	[self.view addSubview:self.motionImageView];
	
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.backgroundImageView startAnimate];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.backgroundImageView stopAnimate];
}

#pragma mark - delegate


#pragma mark - event response


#pragma mark - private methods


#pragma mark - getters and setters
- (YGGravityImageView *)backgroundImageView {
	if (!_backgroundImageView) {
		_backgroundImageView = [[YGGravityImageView alloc] initWithFrame:self.view.frame];
		_backgroundImageView.image = [UIImage imageNamed:@"waitan"];
		self.view.clipsToBounds = YES;
	}
	return _backgroundImageView;
}



- (UIImageView *)motionImageView {
	if (!_motionImageView) {
		
		_motionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Scarlett"]];
		_motionImageView.contentMode = UIViewContentModeScaleAspectFit;
		[_motionImageView addMotionEffect:[UIMotionEffectGroup motionEffectGroupWithEffectX:motionEffectX]];
		
		CGFloat motionEffectY = motionEffectX * 1136 /640;
		_motionImageView.frame = CGRectMake(-motionEffectX, -motionEffectY, self.view.frame.size.width + motionEffectX*2, self.view.frame.size.height + motionEffectY*2);
	}
	return _motionImageView;
}

@end

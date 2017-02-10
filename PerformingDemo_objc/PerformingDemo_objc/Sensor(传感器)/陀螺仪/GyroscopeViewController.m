//
//  GyroscopeViewController.m
//  PerformingDemo_objc
//
//  Created by Queuey on 2017/2/10.
//  Copyright © 2017年 queuey. All rights reserved.
//

#import "GyroscopeViewController.h"
#import "YGGravityImageView.h"

@interface GyroscopeViewController ()
//背景图
@property(nonatomic, strong) YGGravityImageView *backgroundImageView;

@end

@implementation GyroscopeViewController


#pragma mark - life cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"陀螺仪";
	
	[self.view addSubview:self.backgroundImageView];
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




@end

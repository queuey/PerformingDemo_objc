//
//  AppDelegate.m
//  PerformingDemo_objc
//
//  Created by Queuey on 2017/2/9.
//  Copyright © 2017年 queuey. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTableViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	self.window = ({
		UIWindow *window = [[UIWindow alloc] init];
		[window setFrame:[[UIScreen mainScreen] bounds]];
		[window setBackgroundColor:[UIColor whiteColor]];
		[window makeKeyAndVisible];
		window;
	});
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[MainTableViewController new]];
	
	
	return YES;
}




@end

//
//  SensorTableViewController.m
//  PerformingDemo_objc
//
//  Created by Queuey on 2017/2/10.
//  Copyright © 2017年 queuey. All rights reserved.
//

#import "SensorTableViewController.h"


static NSString * const kSensorTableViewControllerID = @"SensorTableViewControllerID";


@interface SensorTableViewController ()

@property(nonatomic, strong) NSMutableArray *items;

@property(nonatomic, strong) NSMutableArray *subViewControllers;

@end

@implementation SensorTableViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"传感器";
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSensorTableViewControllerID];
	self.tableView.tableFooterView = [UIView new];
	
	self.items = [NSMutableArray new];
	self.subViewControllers = [NSMutableArray new];
	
	[self addCellTitle:@"陀螺仪" childViewController:@"GyroscopeViewController"];
	[self addCellTitle:@"重力感应" childViewController:@"GravityViewController"];
	
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSensorTableViewControllerID forIndexPath:indexPath];
	cell.textLabel.text = self.items[indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	Class CustomViewController = NSClassFromString(self.subViewControllers[indexPath.row]);
	
	UIViewController *viewController = [CustomViewController new];
	if (viewController) [self.navigationController pushViewController:viewController animated:YES];
	
}


- (void)addCellTitle:(NSString *)cellTitle childViewController:(NSString *)childViewControllerName {
	[self.items addObject:cellTitle];
	[self.subViewControllers addObject:childViewControllerName];
}


@end

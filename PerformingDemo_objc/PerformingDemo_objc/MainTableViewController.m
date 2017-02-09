//
//  MainTableViewController.m
//  PerformingDemo_objc
//
//  Created by Queuey on 2017/2/9.
//  Copyright © 2017年 queuey. All rights reserved.
//

#import "MainTableViewController.h"

static NSString * const kMainTableViewControllerID = @"MainTableViewControllerID";

@interface MainTableViewController ()

@property(nonatomic, strong) NSMutableArray *items;

@property(nonatomic, strong) NSMutableArray *subViewControllers;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Demo";
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMainTableViewControllerID];
	self.tableView.tableFooterView = [UIView new];
	
	self.items = [NSMutableArray new];
	self.subViewControllers = [NSMutableArray new];
	
	[self addCellTitle:@"陀螺仪" childViewController:@"GravityViewController"];
	
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainTableViewControllerID forIndexPath:indexPath];
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

#pragma mark - delegate



#pragma mark - event response



#pragma mark - private methods
- (void)addCellTitle:(NSString *)cellTitle childViewController:(NSString *)childViewControllerName {
	[self.items addObject:cellTitle];
	[self.subViewControllers addObject:childViewControllerName];
}


#pragma mark - getters and setters




@end

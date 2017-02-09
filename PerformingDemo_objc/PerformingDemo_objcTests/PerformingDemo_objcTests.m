//
//  PerformingDemo_objcTests.m
//  PerformingDemo_objcTests
//
//  Created by Queuey on 2017/2/9.
//  Copyright © 2017年 queuey. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PerformingDemo_objcTests : XCTestCase

@end

@implementation PerformingDemo_objcTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

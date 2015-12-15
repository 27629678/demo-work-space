//
//  DemoTests.m
//  DemoTests
//
//  Created by H-YXH on 8/24/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NENode.h"

@interface DemoTests : XCTestCase

@property (nonatomic) NENode* test_node;

@end

@implementation DemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _test_node = [NENode new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    _test_node.then(@"1").then(@"2").then(@"3");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

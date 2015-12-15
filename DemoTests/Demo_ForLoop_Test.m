//
//  Demo_ForLoop_Test.m
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/27.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

typedef void(^XCT_Handler)();

@interface Demo_ForLoop_Test : XCTestCase

@property (nonatomic) NSMutableArray* handlers;

@end

@implementation Demo_ForLoop_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _handlers = [NSMutableArray array];
    for (NSInteger idx = 0; idx < 10; idx ++) {
        [self addHandlerAction];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    @synchronized(self) {
        for (XCT_Handler handler in _handlers) {
            handler();
            [self performSelector:@selector(addHandlerAction) withObject:nil];
        }
    }
}

- (void)addHandlerAction
{
    @synchronized(self) {
        [_handlers addObject:^(){
            NSLog(@"%@", [NSDate date]);
        }];
    }
}

@end

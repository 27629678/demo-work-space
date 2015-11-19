//
//  NETest.h
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NEPrepareBlock)();

@interface NETest : NSObject

- (BOOL)start;

@end

@interface NETest (ForSubClassEyesOnly)

- (void)willStart;

- (void)didStart;

@end

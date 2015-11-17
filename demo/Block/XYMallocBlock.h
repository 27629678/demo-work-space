//
//  XYMallocBlock.h
//  Demo
//
//  Created by hzyuxiaohua on 11/17/15.
//  Copyright © 2015 X Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^XYMallocHandler)();

@interface XYMallocBlock : NSObject

- (instancetype)initWithBlock:(XYMallocHandler)block;

- (void)runBlock;

@end

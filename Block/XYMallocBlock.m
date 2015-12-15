//
//  XYMallocBlock.m
//  Demo
//
//  Created by hzyuxiaohua on 11/17/15.
//  Copyright © 2015 X Co., Ltd. All rights reserved.
//

#import "XYMallocBlock.h"

@interface XYMallocBlock ()

@property (nonatomic, copy) XYMallocHandler block;

@end

@implementation XYMallocBlock

- (instancetype)initWithBlock:(XYMallocHandler)block
{
    if (self = [super init]) {
        self.block = block;
    }
    
    return self;
}

- (void)runBlock
{
    self.block();
}

@end

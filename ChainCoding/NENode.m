//
//  NENode.m
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/28.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "NENode.h"

@implementation NENode

- (NENode *(^)(NSString *))then
{
    return ^(NSString *msg) {
        NSLog(@"Running Message:%@", msg);
        
        return [NENode new];
    };
}

@end

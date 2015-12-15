//
//  XYGlobalBlock.m
//  Demo
//
//  Created by hzyuxiaohua on 11/17/15.
//  Copyright © 2015 X Co., Ltd. All rights reserved.
//

#import "XYGlobalBlock.h"

@implementation XYGlobalBlock

- (void)runBlock
{
    (^{
        NSLog(@"<concrete global block running...>");
    }());
}

@end

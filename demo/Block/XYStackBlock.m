//
//  XYStackBlock.m
//  Demo
//
//  Created by hzyuxiaohua on 11/17/15.
//  Copyright © 2015 X Co., Ltd. All rights reserved.
//

#import "XYStackBlock.h"

@implementation XYStackBlock

- (void)runBlock
{
    void (^call_back)() = ^() {
        NSLog(@"<stack block running...>");
    };
    
    call_back();
}

@end

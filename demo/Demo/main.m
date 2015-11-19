//
//  main.m
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "XYStackBlock.h"
#import "XYGlobalBlock.h"
#import "XYMallocBlock.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [[XYGlobalBlock new] runBlock];
        [[XYStackBlock new] runBlock];
        [[[XYMallocBlock alloc] initWithBlock:^{
            NSLog(@"<malloc block is running...>");
        }] runBlock];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

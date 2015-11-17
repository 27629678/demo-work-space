//
//  main.m
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright (c) 2015 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "XYStackBlock.h"
#import "XYGlobalBlock.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [[XYGlobalBlock new] runBlock];
        [[XYStackBlock new] runBlock];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

//
//  NETest.m
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "NETest.h"

@interface NETest ()

@property (nonatomic, copy) NEPrepareBlock prepareBlock;

@end

@implementation NETest

- (BOOL)start
{
    NSLog(@"<-----%@ enter into testing...----->", [self class]);
    
    [self willStart];
    
    [self didStart];
    
    NSLog(@"<-----%@ testing end----->", [self class]);
    
    return YES;
}

@end

@implementation NETest (ForSubClassEyesOnly)

- (void)willStart
{
    
}

- (void)didStart
{
    
}

@end
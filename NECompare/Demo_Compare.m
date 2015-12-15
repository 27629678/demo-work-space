//
//  Demo_Compare.m
//  Demo
//
//  Created by H-YXH on 8/26/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "Demo_Compare.h"

@implementation Demo_Compare

- (void)didStart
{
    NSString* v1 = @"8.4.1";
    NSString* v2 = @"8.4";
    
    NSLog(@"[%@ compare:%@ options:NSNumericSearch]", v1, v2);
    switch ([v1 compare:v2 options:NSNumericSearch]) {
        case NSOrderedAscending:
            NSLog(@"Ascending");
            break;
            
        case NSOrderedSame:
            NSLog(@"Same");
            break;
            
        case NSOrderedDescending:
            NSLog(@"Descending");
            break;
    }
}

@end

//
//  Demo_VariableArguments.m
//  Demo
//
//  Created by H-YXH on 8/29/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "Demo_VariableArguments.h"

@implementation Demo_VariableArguments

- (void)didStart
{
    [self ne_printf:@"1", nil, @"2", nil, @"3", nil, NULL];
}

- (void)ne_printf:(NSString *)string, ...
{
    va_list arg_list;
    va_start(arg_list, string);
    id arg = va_arg(arg_list, id);
    while (YES) {
        NSLog(@"%@", arg);
        __unused NSString* result = [[NSString alloc] initWithFormat:string arguments:arg_list];
        arg = va_arg(arg_list, id);
    }
    va_end(arg_list);
}

@end

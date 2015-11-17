//
//  XYCharacterEscaper.m
//  Demo
//
//  Created by hzyuxiaohua on 15/11/17.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "XYCharacterEscaper.h"

@interface XYCharacterEscaper ()

@property (nonatomic, copy) NSString* source;

@end

@implementation XYCharacterEscaper

- (NSString *)value
{
    return _source;
}

+ (instancetype)escaperWithSource:(NSString *)source
{
    if (!source) {
        return nil;
    }
    
    XYCharacterEscaper* escaper = [XYCharacterEscaper new];
    [escaper setSource:source];
    
    return escaper;
}

- (XYEscaperHandler)escapeSemicolon
{
    return ^() {
        NSString* target = [_source stringByReplacingOccurrencesOfString:@"\\;" withString:@";"];
        _source = [target stringByReplacingOccurrencesOfString:@";" withString:@"\\;"];
        
        return self;
    };
}

- (XYEscaperHandler)unescapeSemicolon
{
    return ^ () {
        _source = [_source stringByReplacingOccurrencesOfString:@"\\;" withString:@";"];
        
        return self;
    };
}

@end

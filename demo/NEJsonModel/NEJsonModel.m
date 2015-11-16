//
//  NEJsonModel.m
//  Demo
//
//  Created by H-YXH on 8/25/15.
//  Copyright (c) 2015 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

#import "NEJsonModel.h"

#import <objc/runtime.h>

#import "JSONValueTransformer.h"

static NSArray* kClassPropertiesKey = nil;

static NSArray* __allowedJsonTypes = nil;
static NSArray* __allowedPrimitiveTypes = nil;
static NSDictionary* __primitiveDict = nil;
static JSONValueTransformer* __valueTransformer = nil;

@implementation NEJsonModel

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            __allowedJsonTypes = @[[NSNull class],
                                   [NSString class],
                                   [NSMutableString class],
                                   [NSNumber class],
                                   [NSDecimalNumber class],
                                   [NSArray class],
                                   [NSMutableArray class],
                                   [NSDictionary class],
                                   [NSMutableDictionary class]];
            
            __allowedPrimitiveTypes = @[@"BOOL",
                                        @"float",
                                        @"int",
                                        @"long",
                                        @"double",
                                        @"short",
                                        @"NSInteger",
                                        @"NSUInteger",
                                        @"Block"];
            
            __primitiveDict = @{@"f" : @"float",
                                @"i" : @"int",
                                @"d" : @"double",
                                @"l" : @"long",
                                @"c" : @"BOOL",
                                @"s" : @"short",
                                @"q" : @"long",
                                @"I" : @"NSInteger",
                                @"Q" : @"NSUInteger",
                                @"B" : @"BOOL",
                                @"@?": @"Block"};
            
            __valueTransformer = [[JSONValueTransformer alloc] init];
        }
    });
}

- (NSDictionary *)propertiesFromClass
{
    NSDictionary* ret_dict = objc_getAssociatedObject(self.class, &kClassPropertiesKey);
    if (!ret_dict) {
        [self __setup__];
        ret_dict = objc_getAssociatedObject(self.class, &kClassPropertiesKey);
    }
    
    return ret_dict;
}

- (void)__setup__
{
    if (!objc_getAssociatedObject(self.class, &kClassPropertiesKey)) {
        [self __inspect_class_properties__];
    }
}

- (void)__inspect_class_properties__
{
    Class cls = [self class];
    
    while (cls != [NEJsonModel class]) {
        NSLog(@"<Current Class:%@>", NSStringFromClass(cls));
        
        // fetch class property list
        unsigned int property_count;
        objc_property_t* properties = class_copyPropertyList(cls, &property_count);
        NSLog(@"<Class[%@]->Property Count:%d>", NSStringFromClass(cls), property_count);
        
        // enum object in property list
        for (int idx = 0; idx < property_count; idx ++) {
            objc_property_t property = properties[idx];
            
            const char* property_name = property_getName(property);
            
//            NSLog(@"<Property Name:%s>", property_name);
            
            const char* property_attributes = property_getAttributes(property);
            
            NSLog(@"<Property Attributes:%s>", property_attributes);
        }
        
        cls = [cls superclass];
    }
}

@end

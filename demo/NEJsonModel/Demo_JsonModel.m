//
//  Demo_JsonModel.m
//  Demo
//
//  Created by H-YXH on 8/25/15.
//  Copyright (c) 2015 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

#import "Demo_JsonModel.h"

#import "NEJsonModel.h"

@interface DemoModel : NEJsonModel

@property (nonatomic) NSString* string;
@property (nonatomic) NSNumber* number;
@property (nonatomic) NSArray<Ignore>* array;
@property (nonatomic) NSMutableArray* mutable_array;
@property (nonatomic) NSDictionary* dictionary;
@property (nonatomic) NSMutableDictionary* mutable_dictionary;

@end

@implementation DemoModel @end


@implementation Demo_JsonModel

- (void)didStart
{
    DemoModel* model = [[DemoModel alloc] init];
    
    NSDictionary* properties = [model propertiesFromClass];
    
    NSLog(@"Properties:%@", properties);
}

@end

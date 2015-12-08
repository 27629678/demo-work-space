//
//  XYTableViewModel.m
//  Demo
//
//  Created by hzyuxiaohua on 15/12/8.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "XYTableViewModel.h"

@interface XYTableViewModel ()

@property (nonatomic, strong) NSArray* cell_items;

@end

@implementation XYTableViewModel

+ (instancetype)tableViewModel
{
    return [[self alloc] init];
}

- (void)addCellItems:(NSArray *)items
{
    _cell_items = items.copy;
}

- (NSArray *)itemsForDisplay
{
    NSMutableArray* items = [NSMutableArray new];
    for (XYTableViewCellDataItem* item in _cell_items) {
        if (item.hide_handler()) {
            [items addObject:item];
        }
    }
    
    return items.copy;
}

@end

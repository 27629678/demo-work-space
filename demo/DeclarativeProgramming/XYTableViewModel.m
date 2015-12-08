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

@property (nonatomic, strong) NSArray* cell_items_for_display;

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

- (void)applyCurrentState
{
    NSMutableArray* items = [NSMutableArray new];
    for (XYTableViewCellDataItem* item in _cell_items) {
        if (item.hide_handler()) {
            [items addObject:item];
        }
    }
    
    _cell_items_for_display = items.copy;
}

- (NSInteger)items_count_for_display
{
    return _cell_items_for_display.count;
}

- (XYTableViewCellDataItem *)itemWithIndexPath:(NSIndexPath *)index_path
{
    return [_cell_items_for_display objectAtIndex:index_path.row];
}

@end

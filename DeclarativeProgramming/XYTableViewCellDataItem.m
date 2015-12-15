//
//  XYTableViewCellDataItem.m
//  Demo
//
//  Created by hzyuxiaohua on 15/12/8.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "XYTableViewCellDataItem.h"

@implementation XYTableViewCellDataItem

+ (instancetype)itemWithTitle:(NSString *)title
{
    XYTableViewCellDataItem* item = [[self alloc] init];
    item.title = title;
    
    return item;
}

#pragma mark - getter & setter

- (XYTableViewItemHideHandler)hide_handler
{
    if (!_hide_handler) {
        _hide_handler = ^() {
            return YES;     // display item by default
        };
    }
    
    return _hide_handler;
}

- (XYTableViewItemClickHandler)click_handler
{
    if (!_click_handler) {
        __weak __typeof(self) weakself = self;
        _click_handler = ^(UIViewController *target, UITableView *tableView, NSIndexPath *indexPath) {
            NSCAssert(NO, @"You MUST set up the click handler for item:%@", weakself.title);
        };
    }
    
    return _click_handler;
}

@end

//
//  XYTableViewCellDataItem.h
//  Demo
//
//  Created by hzyuxiaohua on 15/12/8.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^XYTableViewItemHideHandler)();
typedef void(^XYTableViewItemClickHandler)(UIViewController *target, UITableView *tableView, NSIndexPath *indexPath);

@interface XYTableViewCellDataItem : NSObject

@property (nonatomic, copy) NSString* title;

@property (nonatomic, copy) XYTableViewItemHideHandler hide_handler;
@property (nonatomic, copy) XYTableViewItemClickHandler click_handler;

+ (instancetype)itemWithTitle:(NSString *)title;

@end

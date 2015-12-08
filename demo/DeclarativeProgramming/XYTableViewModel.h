//
//  XYTableViewModel.h
//  Demo
//
//  Created by hzyuxiaohua on 15/12/8.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XYTableViewCellDataItem.h"

typedef XYTableViewCellDataItem* (^XYTVMAddItemHandler)(NSString *title);

@interface XYTableViewModel : NSObject

@property (nonatomic, readonly) NSInteger items_count_for_display;

+ (instancetype)tableViewModel;

- (void)addCellItems:(NSArray *)items;

- (void)applyCurrentState;

- (XYTableViewCellDataItem *)itemWithIndexPath:(NSIndexPath *)index_path;

@end

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

+ (instancetype)tableViewModel;

- (void)addCellItems:(NSArray *)items;

@end

//
//  NENode.h
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/28.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NENode : NSObject

- (NENode *(^)(NSString *msg))then;

@end

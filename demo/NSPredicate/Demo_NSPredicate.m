//
//  Demo_NSPredicate.m
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright (c) 2015 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

#import "Demo_NSPredicate.h"

@implementation Demo_NSPredicate

- (void)didStart
{
    NSLog(@"1");
    [self testForContain];
    NSLog(@"2");
    [self testForNotIn];
    NSLog(@"3");
    [self testForCompare];
    NSLog(@"4");
    [self testForLike];
    NSLog(@"5");
    [self testForCompare2];
    NSLog(@"6");
    [self testForExpression];
}

- (void)testForContain
{
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"pict", @"blackrain", @"ip", nil];
    
    NSArray *arrayContents = [NSArray arrayWithObjects:@"I am a picture.", @"I am a guy", @"I am gagaga", @"ipad", @"iphone", nil];
    
    for (NSString* content in arrayFilter) {
        NSPredicate* aPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", content];
        
        NSLog(@"Filterd Array with filter %@, %@", content, [arrayContents filteredArrayUsingPredicate:aPredicate]);
    }
}

// 字符串本身:SELF
// 范围运算符：IN、BETWEEN
- (void)testForNotIn
{
    NSArray *arrayFilter = [NSArray arrayWithObjects:@"abc1", @"abc2", nil];
    
    NSArray *arrayContent = [NSArray arrayWithObjects:@"a1", @"abc1", @"abc4", @"abc2", nil];
    
    NSPredicate *thePredicate = [NSPredicate predicateWithFormat:@"NOT (SELF in %@)", arrayFilter];
    
    NSLog(@"%@", [arrayContent filteredArrayUsingPredicate:thePredicate]);
}

// 可用于数值及字符串
// 比较运算符>,<,==,>=,<=,!=
- (void)testForCompare
{
    NSArray* directorys = [self directorysForTest];
    
    NSString *match = @"imagexyz-999.png";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", match];
    NSArray *results = [directorys filteredArrayUsingPredicate:predicate];
    
    NSLog(@"%@", results);
}

// 通配符：LIKE
// @"name LIKE[cd] '*er*'"    //*代表通配符,Like也接受[cd]
// @"name LIKE[cd] '???er*'"
- (void)testForLike
{
    NSArray* directorys = [self directorysForTest];
    
    NSString *match = @"imagexyz*.png";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like %@", match];
    
    NSArray *results = [directorys filteredArrayUsingPredicate:predicate];

    NSLog(@"%@", results);
}

// 字符串相关：BEGINSWITH、ENDSWITH、CONTAINS
// @"name CONTAIN[cd] 'ang'"   //包含某个字符串
// @"name BEGINSWITH[c] 'sh'"     //以某个字符串开头
// @"name ENDSWITH[d] 'ang'"      //以某个字符串结束
- (void)testForCompare2
{
    // ［c］表示忽略大小写，［d］表示忽略重音
    NSArray* directorys = [self directorysForTest];
    
    NSString *match = @"imagexyz*.png";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like[cd] %@", match];
    
    NSArray *results = [directorys filteredArrayUsingPredicate:predicate];
    
    NSLog(@"%@", results);
}

// 正则表达式：MATCHES
// NSString *regex = @"^A.+e$";   //以A开头，e结尾
// @"name MATCHES %@",regex
- (void)testForExpression
{
    NSArray* directorys = [self directorysForTest];
    
    NSString *match = @"imagexyz-\\d{3}\\.png";  //imagexyz－123.png
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    
    NSArray *results = [directorys filteredArrayUsingPredicate:predicate];
    
    NSLog(@"%@", results);
}

- (NSArray *)directorysForTest
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *defaultPath = [[NSBundle mainBundle] resourcePath];
    NSError *error;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:defaultPath error:&error];
    
    return directoryContents;
}

@end

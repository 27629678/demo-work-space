//
//  ViewController.m
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright (c) 2015 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

#import "ViewController.h"

#import "Demo_Compare.h"
#import "Demo_JsonModel.h"
#import "Demo_NSPredicate.h"
#import "Demo_VariableArguments.h"
#import "Demo_JavascriptCore.h"

#import "Demo-Bridging-Header.h"

#import "objc-Swift.h"

@interface ViewController ()

@property (nonatomic) Demo_Compare* compareDemo;
@property (nonatomic) Demo_JsonModel* jsonModelDemo;
@property (nonatomic) Demo_NSPredicate* predicateDemo;
@property (nonatomic) Demo_JavascriptCore* javascriptDemo;
@property (nonatomic) Demo_VariableArguments* variableArgumentsDemo;

@end

@implementation ViewController
{
    BOOL _isFirstAppear;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // compare demo
    _compareDemo = [[Demo_Compare alloc] init];
//    [_compareDemo start];
    
    // json model demo
    _jsonModelDemo = [[Demo_JsonModel alloc] init];
    
//    [_jsonModelDemo start];
    
    NSLog(@"======================================");
    // predicate demo
    _predicateDemo = [[Demo_NSPredicate alloc] init];
    
//    [_predicateDemo start];
    
    // variable arguments demo
    _variableArgumentsDemo = [[Demo_VariableArguments alloc] init];
//    [_variableArgumentsDemo start];
    
    _javascriptDemo = [[Demo_JavascriptCore alloc] init];
    [_javascriptDemo start];
    NEK_MailThread_Assert();
    
    NSString* userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)",
                           [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey]
                           ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey],
                           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
    NSLog(@"%@", userAgent);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 40, 20)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(presentTextVCAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!self->_isFirstAppear) {
        [self presentTextVCAction:nil];
        self->_isFirstAppear = YES;
    }
}

- (void)presentTextVCAction:(UIButton *)sender
{
    __unused SignatureSettingViewController* svc = [[SignatureSettingViewController alloc] init];
    __unused TextViewController* tvc = [[TextViewController alloc] initWithNibName:@"TextViewController" bundle:nil];
    __unused TextTableViewController* vc = [[TextTableViewController alloc] init];
    
//    [self presentViewController:tvc animated:YES completion:NULL];
    __unused UINavigationController* nvc = [[UINavigationController alloc] initWithRootViewController:svc];
    [self presentViewController:nvc animated:YES completion:NULL];
}

@end
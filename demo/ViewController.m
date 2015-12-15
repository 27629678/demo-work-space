//
//  ViewController.m
//  Demo
//
//  Created by H-YXH on 8/24/15.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "ViewController.h"

#import "Demo_Compare.h"
#import "Demo_JsonModel.h"
#import "Demo_NSPredicate.h"
#import "Demo_VariableArguments.h"
#import "Demo_JavascriptCore.h"

#import "Demo-Bridging-Header.h"

#import "objc-Swift.h"
#import "XYCharacterEscaper.h"

#import "XYTextFieldViewController.h"
#import "XYDeclarativeTableViewController.h"

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
    UITextField* _character_text_field;
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

- (void)presentDeclarativeTableVC
{
    XYDeclarativeTableViewController* svc = [[XYDeclarativeTableViewController alloc] init];
    UINavigationController* nvc = [[UINavigationController alloc] initWithRootViewController:svc];
    [self presentViewController:nvc animated:YES completion:NULL];
}

- (void)presentTextFieldVC
{
    XYTextFieldViewController* svc = [[XYTextFieldViewController alloc]
                                      initWithNibName:@"XYTextFieldViewController" bundle:nil];
    UINavigationController* nvc = [[UINavigationController alloc] initWithRootViewController:svc];
    [self presentViewController:nvc animated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 40, 20)];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(doCharacterEscapeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    _character_text_field = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, 80, 20)];
    [_character_text_field setBackgroundColor:[UIColor grayColor]];
    NSString* ctlf = @"\\\\,";
    [_character_text_field setText:ctlf];
    if ([ctlf isEqualToString:@"\n"]) {
        NSLog(@"yes");
    }
    if ([_character_text_field.text isEqualToString:@"\n"]) {
        NSLog(@"yes1");
    }
    [self.view addSubview:_character_text_field];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!self->_isFirstAppear) {
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

- (void)doCharacterEscapeAction:(id)sender
{
    NSString* source = _character_text_field.text;
    
    XYCharacterEscaper* escaper = [XYCharacterEscaper escaperWithSource:source              ];
    NSLog(@"%@", escaper.value);
    
    escaper.escapeColon().escapeComma().escapeSemicolon();
    NSLog(@"%@", escaper.value);
    
    escaper.unescapeComma().unescapeColon().unescapeSemicolon();
    NSLog(@"%@", escaper.value);
    
    _character_text_field.text = escaper.value;

//    NSLog(@"\nSource:\t\t%@"
//          "\nSemicolon:\t\t%@"
//          "\nUnsemicolon:\t%@"
//          "\nColon:\t\t%@"
//          "\nUncolon:\t\t%@"
//          "\nComma:\t\t%@"
//          "\nUncomma:\t\t%@"
//          "\nCTLF:\t\t\t%@"
//          "\nUnCTLF:\t\t%@",
//          escaper.value,
//          escaper.escapeSemicolon().value,
//          escaper.unescapeSemicolon().value,
//          escaper.escapeColon().value,
//          escaper.unescapeColon().value,
//          escaper.escapeComma().value,
//          escaper.unescapeComma().value,
//          escaper.unescapeCTLF().value,
//          escaper.escapeCTLF().value
//          );
    
//    [self presentDeclarativeTableVC];
    [self presentTextFieldVC];
}

@end

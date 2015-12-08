//
//  XYDeclarativeTableViewController.m
//  Demo
//
//  Created by hzyuxiaohua on 15/12/8.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

#import "XYDeclarativeTableViewController.h"

#import "XYTableViewModel.h"

@interface XYDeclarativeTableViewController ()

@property (nonatomic, strong) XYTableViewModel* tb_model;

@property (nonatomic, strong) NSArray* cell_items;

@end

@implementation XYDeclarativeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadTableViewModel];
}

- (void)loadTableViewModel
{
    XYTableViewCellDataItem* a_item = [XYTableViewCellDataItem itemWithTitle:@"a"];
    [a_item setHide_handler:^(){
        return YES;
    }];
    
    [a_item setClick_handler:^(UIViewController *target, UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"a was clicked.");
    }];
    
    XYTableViewCellDataItem* b_item = [XYTableViewCellDataItem itemWithTitle:@"b"];
    [b_item setHide_handler:^(){
        return YES;
    }];
    
    [b_item setClick_handler:^(UIViewController *target, UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"b was clicked.");
    }];
    
    _tb_model = [XYTableViewModel tableViewModel];
    [_tb_model addCellItems:@[a_item, b_item]];
    
    [_tb_model applyCurrentState];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tb_model.items_count_for_display;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYTableViewCellDataItem* item = [_tb_model itemWithIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"haha"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"haha"];
    }
    
    [cell.textLabel setText:item.title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYTableViewCellDataItem* item = [_tb_model itemWithIndexPath:indexPath];
    item.click_handler(self, tableView, indexPath);
}

@end

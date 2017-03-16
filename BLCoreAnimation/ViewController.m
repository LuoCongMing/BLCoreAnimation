//
//  ViewController.m
//  BLCoreAnimation
//
//  Created by 周建波 on 2017/3/15.
//  Copyright © 2017年 scqc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,copy)NSArray*controllers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Core Animation";
    self.tableView.rowHeight = 40;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
    _controllers = @[@"FirstDayViewController"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _controllers.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightThin];
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 天",indexPath.row+1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController*controller =(UIViewController*)[NSClassFromString(_controllers[indexPath.row]) new];
    [self.navigationController pushViewController:controller animated:YES];
}
@end

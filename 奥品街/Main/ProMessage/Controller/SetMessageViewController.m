//
//  SetMessageViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "SetMessageViewController.h"

@interface SetMessageViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSArray *_titles;
}

@end

@implementation SetMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息设置";
    [self _createTable];
    
}

- (void)_createTable{
    _titles = @[@"接收新消息通知",@"铃声提醒",@"振动提示"];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.sectionFooterHeight = 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //标题
    cell.textLabel.text = _titles[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    //开关
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectMake(kScreenWidth - 65, 7, 50, 25)];
    switchView.tag = 100 + indexPath.row;
    [switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [cell.contentView addSubview:switchView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}

#pragma mark-开关点击事件
- (void)switchAction:(UISwitch *)currentSwitch{
    NSLog(@"开关在动");
}

- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end

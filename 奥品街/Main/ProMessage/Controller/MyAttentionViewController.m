//
//  MyAttentionViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "MyAttentionViewController.h"
static NSString *identity = @"attentionCell";
@interface MyAttentionViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@end

@implementation MyAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的关注";
    [self _createTable];
}

- (void)_createTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth, kScreenHeight - 64 - 5) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100;
    [_tableView registerNib:[UINib nibWithNibName:@"MyAttentionCell" bundle:nil] forCellReuseIdentifier:identity];
    _tableView.backgroundColor = [UIColor clearColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end

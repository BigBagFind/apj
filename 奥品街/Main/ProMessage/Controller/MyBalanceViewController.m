//
//  MyBalanceViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/2.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "MyBalanceViewController.h"
static NSString *identity = @"balanceCell";
@interface MyBalanceViewController (){
    UITableView *_balanceList;
}

@end

@implementation MyBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的返利";
    [self _createSubviews];
}

- (void)_createSubviews{
    _balanceList = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_balanceList];
    _balanceList.backgroundColor = [UIColor clearColor];
    _balanceList.delegate = self;
    _balanceList.dataSource = self;
    _balanceList.rowHeight = 100;
    _balanceList.sectionFooterHeight = 0;
    [_balanceList registerNib:[UINib nibWithNibName:@"BalanceCell" bundle:nil] forCellReuseIdentifier:identity];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BalanceCell *cell = [tableView dequeueReusableCellWithIdentifier:identity forIndexPath:indexPath];
    return cell;
}


@end

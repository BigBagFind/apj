//
//  StoreManagementViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/2.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "StoreManagementViewController.h"
static NSString *identity = @"storeCell";
@interface StoreManagementViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
}

@end

@implementation StoreManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"店铺管理";
    [self _createTable];
}


- (void)_createTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [_tableView registerNib:[UINib nibWithNibName:@"StoreManagermentViewCell" bundle:nil] forCellReuseIdentifier:identity];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 70;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StoreManagermentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    
    if (indexPath.row != 0) {
        cell.storeIcon.image = nil;
    }
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self appearAlertController];
    }
    
}



@end

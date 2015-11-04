//
//  OrdersListView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "OrdersListView.h"
static NSString *identity = @"orderCell";
@implementation OrdersListView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _configurateSelf];
    }
    return self;
}

- (void)_configurateSelf{
    self.delegate = self;
    self.dataSource = self;
    self.sectionFooterHeight = 40;
    [self registerNib:[UINib nibWithNibName:@"OrdersCell" bundle:nil] forCellReuseIdentifier:identity];
    self.rowHeight = 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrdersCell *cell = [tableView dequeueReusableCellWithIdentifier:identity forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button];
    [button setBackgroundImage:[UIImage imageNamed:@"list_bg_a"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [button setTitle:@"删除订单" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.frame = CGRectMake(kScreenWidth - 105, 7.5, 90, 25);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *detailVc = [[DetailViewController alloc]init];
    detailVc.hidesBottomBarWhenPushed = YES;
    [self.viewController.navigationController pushViewController:detailVc animated:YES];
    if ([self.viewController.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.viewController.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}




@end

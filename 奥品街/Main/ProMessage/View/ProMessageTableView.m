//
//  ProMessageTableView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/30.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ProMessageTableView.h"

@implementation ProMessageTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initData];
        [self _configurateSelf];
    }
    return self;
}

- (void)_initData{
    _titles = @[@"店铺管理",@"商品管理",@"我的返利",@"帮助中心",@"关于奥品街"];
    _icons = @[@"mine_box_shop@2x",
               @"mine_box_product@2x",
               @"mine_box_diamond@2x",
               @"mine_box_help@2x",
               @"mine_box_about@2x"];
}

- (void)_configurateSelf{
    self.delegate = self;
    self.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.1 alpha:1];
    cell.imageView.image = [UIImage imageNamed:_icons[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        StoreManagementViewController *storeVc = [[StoreManagementViewController alloc]init];
        storeVc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:storeVc animated:YES];
    }else if(indexPath.row == 1){
        GoodsManagementViewController *goodsVc = [[GoodsManagementViewController alloc]init];
        goodsVc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:goodsVc animated:YES];
    }else if (indexPath.row == 2) {
        MyBalanceViewController *balanceVc = [[MyBalanceViewController alloc]init];
        balanceVc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:balanceVc animated:YES];
    }else if (indexPath.row == 3) {
        HelpCenterViewController *helpVc = [[HelpCenterViewController alloc]init];
        helpVc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:helpVc animated:YES];
    }else if (indexPath.row == 4) {
        AboutApjViewController *aboutVc = [[AboutApjViewController alloc]init];
        aboutVc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:aboutVc animated:YES];
    }
  
}


@end

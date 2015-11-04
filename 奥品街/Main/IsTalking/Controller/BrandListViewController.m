//
//  BrandListViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "BrandListViewController.h"
static NSString *identity = @"brandListCell";
@interface BrandListViewController (){
    UITableView *_listView;
 
}

@end

@implementation BrandListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setNavItems];
    [self _createSubviews];
    
    
}

- (void)_setNavItems{
    //左边按钮
    UIButton *leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    leftItem.frame = CGRectMake(0, 0, 30, 30);
    [leftItem setImage:[UIImage imageNamed:@"arrow_white_l"] forState:UIControlStateNormal];
    [leftItem addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftItem];
    
}

- (void)_createSubviews{
    _listView = [[UITableView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth, kScreenHeight - 64 - 5) style:UITableViewStylePlain];
    [self.view addSubview:_listView];
    _listView.delegate = self;
    _listView.dataSource = self;
    [_listView registerNib:[UINib nibWithNibName:@"BrandListViewCell" bundle:nil] forCellReuseIdentifier:identity];
    _listView.rowHeight = 90;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BrandListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity forIndexPath:indexPath];
    return cell;
}

- (void)leftAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end

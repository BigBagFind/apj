

//
//  DetailViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/30.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setNavItems];
    [self _createSubviews];
    
}

- (void)_setNavItems{
    self.title = @"订单详情";
    //左边按钮
    UIButton *leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    leftItem.frame = CGRectMake(0, 0, 30, 30);
    [leftItem setImage:[UIImage imageNamed:@"arrow_white_l"] forState:UIControlStateNormal];
    [leftItem addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftItem];
    
}

- (void)_createSubviews{
    GoodsDetailView *detailView = [[GoodsDetailView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    detailView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:detailView];
    
}

- (void)leftAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end

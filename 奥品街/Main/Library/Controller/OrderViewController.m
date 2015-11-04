//
//  OrderViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController (){
  
}

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单";
    [self _createSubviews];
}

- (void)_createSubviews{
    NSArray *titles = @[@"全部",@"待付款(3)",@"待发货",@"已发货(15)"];
    NSMutableArray *views = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i ++) {
        OrdersListView *view = [[OrdersListView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth, kScreenHeight - 64 - 49 - 40 + 5) style:UITableViewStyleGrouped];
        view.backgroundColor = [UIColor clearColor];
        [views addObject:view];
    }
    CatalogAllView *catalogView = [[CatalogAllView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) Titles:titles ContentViews:views];
    [self.view addSubview:catalogView];
    
}




@end

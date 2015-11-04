//
//  HelpCenterViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/31.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "HelpCenterViewController.h"

@implementation HelpCenterViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"帮助中心";
    [self _createSubviews];
}

- (void)_createSubviews{
    HelpTableView *helpTable = [[HelpTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    helpTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:helpTable];
}

@end

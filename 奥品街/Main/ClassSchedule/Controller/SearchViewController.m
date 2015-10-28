//
//  SearchViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "SearchViewController.h"
static NSString *identity = @"associateCell";

@interface SearchViewController (){
    GreySearchTextField *_searchField;
    UITableView *_associateList;
}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:236 / 255.0 alpha:1];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self _createViews];
    
}

- (void)_createViews{
    //搜索框~背景图:input_bg_blue
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_grey"]];
    leftImage.frame = CGRectMake(0, 0, 17, 17);
    _searchField = [[GreySearchTextField alloc]initWithFrame:CGRectMake(10, 25,kScreenWidth - 70, 32) IconView:leftImage];
    [self.view addSubview:_searchField];
    _searchField.background = [UIImage imageNamed:@"input_bg_grey"];
    _searchField.delegate = self;
    _searchField.placeholder = @"输入商品名、国家";
    _searchField.textColor = [UIColor darkGrayColor];
    _searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchField.returnKeyType = UIReturnKeySearch;
    [_searchField becomeFirstResponder];
    _searchField.text = self.text;
    //取消按钮
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:cancelButton];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:17];
    cancelButton.frame = CGRectMake(_searchField.right + 5, 25, 50, 32);
    [cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    //联想列表
    _associateList = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kScreenWidth - 15, kScreenHeight - 60) style:UITableViewStylePlain];
    [self.view addSubview:_associateList];
    _associateList.delegate = self;
    _associateList.dataSource = self;
    _associateList.backgroundColor = [UIColor clearColor];
    _associateList.showsVerticalScrollIndicator = NO;
    
}

#pragma mark-取消按钮
- (void)cancelAction:(UIButton *)button{
    
    [self dismissViewControllerAnimated:NO completion:^{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }];
}

#pragma mark-表示图代理和数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

#pragma mark-搜索视图代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self cancelAction:nil];
    
    NSDictionary *dic = @{@"searchText":_searchField.text};
    NSNotification *notification =[NSNotification notificationWithName:kPushNotification object:nil userInfo:dic];
    [[NSNotificationCenter defaultCenter]postNotification:notification];
    
    return YES;
}


@end

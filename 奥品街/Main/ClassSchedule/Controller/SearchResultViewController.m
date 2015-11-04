//
//  SearchResultViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "SearchResultViewController.h"
#import "ResultSearchView.h"
@interface SearchResultViewController (){
    GreySearchTextField *_searchField;
    ResultSearchView *_searchView;
}

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setNavItems];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //搜索视图
    _searchView = [[ResultSearchView alloc]initWithFrame:CGRectMake( 0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_searchView];
    _searchView.hidden = YES;
    //接受text
    __weak SearchResultViewController *weakSelf = self;
    _searchView.transportText = ^(NSString *text){
        __strong SearchResultViewController *strongSelf = weakSelf;
        strongSelf->_searchField.text = text;
    };
}

- (void)viewWillAppear:(BOOL)animated{
    _searchField.hidden = NO;
}


- (void)_setNavItems{
   
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:236 / 255.0 alpha:1];
    //左边按钮
    UIButton *leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    leftItem.backgroundColor = [UIColor clearColor];
    leftItem.frame = CGRectMake(0, 0, 25, 25);
    [leftItem setImage:[UIImage imageNamed:@"arrow_grey_l"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftItem];
    [leftItem addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    // 搜索框
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_grey"]];
    leftImage.frame = CGRectMake(0, 0, 17, 17);
    _searchField = [[GreySearchTextField alloc]initWithFrame:CGRectMake(55 , 5,kScreenWidth - 70, 32) IconView:leftImage];
    [self.navigationController.navigationBar addSubview:_searchField];
    _searchField.background = [UIImage imageNamed:@"input_bg_grey"];
    _searchField.delegate = self;
    _searchField.placeholder = @"输入商品名、国家";
    _searchField.textColor = [UIColor darkGrayColor];
    _searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchField.returnKeyType = UIReturnKeySearch;
    _searchField.text = self.text;
 
}

- (void)leftAction:(UIButton *)button{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [_searchField resignFirstResponder];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:39.0 / 255.0 green:142.0 / 255.0 blue:241.0 / 255.0 alpha:1];
    _searchField.hidden = YES;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //键盘响应
    [[NSNotificationCenter defaultCenter]postNotificationName:kBecomeFisrtNotification object:nil];
    //搜索视图隐藏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    _searchView.hidden = NO;
    _searchView.searchField.text = _searchField.text;
    self.navigationController.navigationBarHidden = YES;
    [_searchView.searchField becomeFirstResponder];
    return NO;
}

@end

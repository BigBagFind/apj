

//
//  GoodsViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "GoodsViewController.h"

@interface GoodsViewController (){
    UIButton *_arrowImage;
    UIImageView *_countryBgView;
    UIImageView *_selectedView;
    NSInteger _selectTag;
    UIScrollView *_scrollView;
    SearchTextField *_searchField;
    UIButton *_leftItem;
    SearchView *_searchView;
}

@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setNavItems];
    [self _createViews];
 
}

#pragma mark-设置导航栏视图
- (void)_setNavItems{
    //左边按钮
    _leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftItem.backgroundColor = [UIColor clearColor];
    _leftItem.frame = CGRectMake(0,0,50,25);
    [_leftItem setTitle:@"国家" forState:UIControlStateNormal];
    _leftItem.titleLabel.font = [UIFont systemFontOfSize:17];
    [_leftItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftItem addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    //小箭头
    _arrowImage = [[UIButton alloc]initWithFrame:CGRectMake(50, _leftItem.top + 15,12, 12)];
    [self.navigationController.navigationBar addSubview:_arrowImage];
    _arrowImage.left = _leftItem.right + 14;
    [_arrowImage setImage:[UIImage imageNamed:@"arrow_white_down"] forState:UIControlStateNormal];
    [_arrowImage setImage:[UIImage imageNamed:@"arrow_white_up"] forState:UIControlStateSelected];
    _arrowImage.userInteractionEnabled = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_leftItem];
    //搜索框~背景图:input_bg_blue
    UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_white"]];
    leftImage.frame = CGRectMake(0, 0, 17, 17);
    _searchField = [[SearchTextField alloc]initWithFrame:CGRectMake(_arrowImage.right + 15, 5,kScreenWidth - 110, 32) IconView:leftImage];
    [self.navigationController.navigationBar addSubview:_searchField];
    _searchField.background = [UIImage imageNamed:@"input_bg_blue"];
    _searchField.delegate = self;
    _searchField.placeholder = @"输入商品名、国家";
    
    
}

#pragma mark-创建视图
- (void)_createViews{
    //弹出国家视图 207 259
    _countryBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"country_bg"]];
    _countryBgView.frame = CGRectMake(0, 39, 103, 130);
    [self.navigationController.navigationBar addSubview:_countryBgView];
    CountryView *countryView = [[CountryView alloc]initWithFrame:CGRectMake(0, 3, 100, 126) style:UITableViewStylePlain];
    countryView.backgroundColor = [UIColor clearColor];
    [_countryBgView addSubview:countryView];
    _countryBgView.hidden = YES;
    //分类视图
    NSArray *titles = @[@"奶粉",@"保健品",@"化妆品"];
    NSMutableArray *views = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i ++) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //单元格大小
        CGFloat width = (kScreenWidth - 5) / 2;
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.itemSize = CGSizeMake(width, 250);
        ProductsList *productsListView = [[ProductsList alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49 - 40) collectionViewLayout:layout];
        productsListView.backgroundColor = [UIColor clearColor];
        [views addObject:productsListView];
    }
    CatalogAllView *catalogView = [[CatalogAllView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 -49) Titles:titles ContentViews:views];
    [self.view addSubview:catalogView];
    //搜索视图
    _searchView = [[SearchView alloc]initWithFrame:CGRectMake( 0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_searchView];
    _searchView.hidden = YES;
}

#pragma mark-按钮点击事件
- (void)leftAction:(UIButton *)button{
    _arrowImage.selected = !_arrowImage.selected;
    _countryBgView.hidden = !_countryBgView.hidden;
   
}

#pragma mark-搜索视图代理

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //国家视图先隐藏
    _countryBgView.hidden = YES;
    //搜索视图隐藏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    _searchView.hidden = NO;
    self.navigationController.navigationBarHidden = YES;
    [_searchView.searchField becomeFirstResponder];
    return NO;
}

@end

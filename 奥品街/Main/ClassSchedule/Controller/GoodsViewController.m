

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
}

@end

@implementation GoodsViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setNavItems];
    [self _createViews];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushSearchAction:) name:kPushNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(modalSearchAction:) name:kModalNotification object:nil];
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
    //分类栏
    NSArray *titles = @[@"奶粉",@"保健品",@"化妆品"];
    UIView *categoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    categoryView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:categoryView];
    CGFloat itemWidth = kScreenWidth / 3;
    for (NSInteger i = 0; i < 3; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * itemWidth,0, itemWidth,categoryView.height)];
        [categoryView addSubview:button];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 300 + i;
        if (i == 0) {
            [button setTitleColor:[UIColor colorWithRed:16.0 / 255.0 green:120.0 / 255.0 blue:222.0 / 255.0 alpha:1] forState:UIControlStateNormal];
        }
    }
    //选择线条
    _selectedView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"list_bg_line"]];
    _selectedView.frame = CGRectMake( 0, categoryView.height - 2, itemWidth, 2);
    [categoryView addSubview:_selectedView];
    _selectTag = 300;
    //底部视图创建
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, kScreenWidth, kScreenHeight - 64 - 49 )];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(kScreenWidth * 3, _scrollView.height);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    //商品列表
    for (NSInteger i = 0; i < 3; i ++) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //单元格大小
        CGFloat width = (kScreenWidth - 5) / 2;
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.itemSize = CGSizeMake(width, 250);
        ProductsList *productsListView = [[ProductsList alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight - 64 - 49 - 40) collectionViewLayout:layout];
        productsListView.backgroundColor = [UIColor clearColor];
        productsListView.tag = 500 + i;
        [_scrollView addSubview:productsListView];
    }

    
}

#pragma mark-按钮点击事件
- (void)leftAction:(UIButton *)button{
    _arrowImage.selected = !_arrowImage.selected;
    _countryBgView.hidden = !_countryBgView.hidden;
    
}

- (void)selectedAction:(UIButton *)button{
    //先取消上一次的颜色
    UIButton *previousButton = (UIButton *)[self.view viewWithTag:_selectTag];
    [previousButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //设置选中选项
    [button setTitleColor:[UIColor colorWithRed:40.0 / 255.0 green:142.0 / 255.0 blue:238.0 / 255.0 alpha:1] forState:UIControlStateNormal];
    CGFloat itemWidth = kScreenWidth / 3;
    //拿到对应商品列表
    [UIView animateWithDuration:0.3 animations:^{
        _selectedView.left = (button.tag - 300) * itemWidth;
        [_scrollView setContentOffset:CGPointMake((button.tag - 300) * kScreenWidth, 0)];
    }];
    _selectTag = button.tag;
    
}

#pragma mark-滑动视图代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _selectedView.left = scrollView.contentOffset.x / 3;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
    UIButton *button = (UIButton *)[self.view viewWithTag:index + 300];
    [self selectedAction:button];
}

#pragma mark-搜索视图代理
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    _countryBgView.hidden = YES;
    SearchViewController *searchVc = [[SearchViewController alloc]init];
    [self.navigationController presentViewController:searchVc animated:NO completion:nil];
}

#pragma mark-通知方法
- (void)pushSearchAction:(NSNotification *)notification{
    NSString *text = notification.userInfo[@"searchText"];
    SearchResultViewController *resultVc = [[SearchResultViewController alloc]init];
    resultVc.text = text;
    resultVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:resultVc animated:YES];
}
- (void)modalSearchAction:(NSNotification *)notification{
    NSString *text = notification.userInfo[@"searchText"];
    SearchViewController *searchVc = [[SearchViewController alloc]init];
    searchVc.text = text;
    [self.navigationController presentViewController:searchVc animated:NO completion:nil];
}



@end

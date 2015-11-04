//
//  ProMessageViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ProMessageViewController.h"

@interface ProMessageViewController (){
    UIButton *_iconView;
    UILabel *_shopName;
    UIView *_maskView;
    ShareView*_shareView;
}

@end

@implementation ProMessageViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置透明
    self.navigationController.navigationBar.translucent = YES;
    UIImage *image = [UIImage imageNamed:@"bg_clear"];
    [self.navigationController.navigationBar setBackgroundImage:image
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:image];
    //隐藏通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideShareView) name:kHideShareView object:nil];
    [self _createHeaderView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)_createHeaderView{
    //底部视图
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor whiteColor];
    //头部背景
    UIImageView *topBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    topBgView.image = [UIImage imageNamed:@"mine_bg_top"];
    [headerView addSubview:topBgView];
    topBgView.userInteractionEnabled = YES;
    //设置按钮
    UIButton *setButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [setButton setImage:[UIImage imageNamed:@"mine_icon_set_a"] forState:UIControlStateNormal];
    [setButton setImage:[UIImage imageNamed:@"mine_icon_set_b"] forState:UIControlStateHighlighted];
    setButton.frame = CGRectMake(kScreenWidth - 60, 0, 50, 25);
    [setButton addTarget:self action:@selector(setAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:setButton];
    //头像
    _iconView = [[UIButton alloc]initWithFrame:CGRectMake(10, 110, 80, 80)];
    [_iconView setImage:[UIImage imageNamed:@"mine_head_icon"] forState:UIControlStateNormal];
    [headerView addSubview:_iconView];
    [_iconView addTarget:self action:@selector(changeIcon) forControlEvents:UIControlEventTouchUpInside];
    _iconView.layer.cornerRadius = 40;
    _iconView.layer.masksToBounds = YES;
    //店铺名
    _shopName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 120, 20)];
    _shopName.bottom = 145;
    _shopName.left = _iconView.right + 10;
    [headerView addSubview:_shopName];
    _shopName.text = @"店铺名称加载中...";
    _shopName.font = [UIFont systemFontOfSize:14];
    _shopName.textColor = [UIColor whiteColor];
    //我的关注
    NSArray *titles = @[@"我的关注",@"分享店铺"];
    NSArray *images = @[@"mine_icon_collect@2x",@"mine_icon_share@2x"];
    for (NSInteger i = 0; i < 2; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.1 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(2,8, 0, 0);
        button.frame = CGRectMake(80 + (kScreenWidth - 100) / 2 * i, 165, (kScreenWidth - 100) / 2, 20);
        [headerView addSubview:button];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
    }
    //功能列表
    ProMessageTableView *itemsTable = [[ProMessageTableView alloc]initWithFrame:CGRectMake( 0, headerView.bottom, kScreenWidth, kScreenHeight - headerView.height) style:UITableViewStyleGrouped];
    itemsTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:itemsTable];
    //盖层
    _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _maskView.backgroundColor = [UIColor colorWithRed:83 / 255.0 green:83 / 255.0 blue:83 / 255.0 alpha:0.5];
    _maskView.hidden = YES;
    [self.view addSubview:_maskView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMaskViewAction)];
    [_maskView addGestureRecognizer:tap];
    //分享
    CGFloat length = ((kScreenWidth - 20) / 3  * 2) - 20 + 50;
    _shareView = [[ShareView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, length)];
    [self.view addSubview:_shareView];
    
}

#pragma  mark-按钮点击事件
- (void)setAction{
    SetViewController *setVc = [[SetViewController alloc]init];
    setVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVc animated:YES];
}

- (void)buttonAction:(UIButton *)button {
    if (button.tag == 100) {
        MyAttentionViewController *attentionVc = [[MyAttentionViewController alloc]init];
        attentionVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:attentionVc animated:YES];
    }else if (button.tag == 101) {
        self.tabBarController.tabBar.hidden = !self.tabBarController.tabBar.hidden;
        [UIView animateWithDuration:0.3 animations:^{
            _shareView.bottom = kScreenHeight;
            _maskView.hidden = NO;
        }];
    }
}

- (void)changeIcon{
    //弹出 alertVc 和maskView
    [self appearAlertController];
}

#pragma mark-通知方法 隐藏shareView
- (void)hideShareView{
    
    [UIView animateWithDuration:0.3 animations:^{
        _shareView.top = kScreenHeight;
        _maskView.hidden = YES;
        self.tabBarController.tabBar.hidden = !self.tabBarController.tabBar.hidden;
    }];
    
}

#pragma mark-MaskViewTapEvent
- (void)tapMaskViewAction{
    [self hideShareView];
}

@end

//
//  MainTabBarController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "MainTabBarController.h"
#import "BrandViewController.h"
#import "GoodsViewController.h"
#import "ProMessageViewController.h"
#import "OrderViewController.h"
#import "BaseNavController.h"

@interface MainTabBarController (){
    NSArray *_selectedImageNames;
    NSArray *_imageNames;
    NSInteger _imageTag;
    NSInteger _labelTag;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createSubControllers];
    [self _createTabBar];
    _imageTag = 100;
    _labelTag = 200;
}


- (void)_createSubControllers{
    NSArray *names = @[@"Goods",
                       @"Brand",
                       @"Order",
                       @"ProMessage"];
    NSMutableArray *navs = [[NSMutableArray alloc]initWithCapacity:names.count];
    for (int i = 0; i < 4; i++) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:names[i] bundle:nil];
        BaseNavController *navVC = [storyBoard instantiateInitialViewController];
        [navs addObject:navVC];
    }
    self.viewControllers = navs;
}

- (void)_createTabBar{
    //移除tabBar子项
    for (UIView *view in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    //创建新项
    NSArray *titles = @[@"商品",@"品牌",@"订单",@"我的"];
    _imageNames = @[
                            @"tabbar_icon_product_a.png",
                            @"tabbar_icon_guide_a.png",
                            @"tabbar_icon_list_a.png",
                            @"tabbar_icon_mine_a.png",
                            ];
    _selectedImageNames = @[
                            @"tabbar_icon_product_b.png",
                            @"tabbar_icon_guide_b.png",
                            @"tabbar_icon_list_b.png",
                            @"tabbar_icon_mine_b.png",
                            ];
    CGFloat itemWidth = kScreenWidth / _imageNames.count;
    for (int i = 0; i < _imageNames.count; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((itemWidth - 35) / 2 + i * itemWidth,2, 35,35)];
        [button setBackgroundImage:[UIImage imageNamed:_imageNames[i]] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 10, 0);
        [self.tabBar addSubview:button];
        [button addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * itemWidth,0, itemWidth, 12)];
        label.top = button.bottom;
        label.font = [UIFont systemFontOfSize:10];
        label.text = titles[i];
        label.tag = 200 + i;
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.tabBar addSubview:label];
        if (i == 0) {
            [button setBackgroundImage:[UIImage imageNamed:_selectedImageNames[i]] forState:UIControlStateNormal];
            label.textColor = [UIColor colorWithRed:0 green:0.6 blue:1 alpha:1];
        }
    }
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg@2x"];
    
}


- (void)selectedAction:(UIButton *)button{
    //先取消上一次的
    UIButton *previousButton = (UIButton *)[self.view viewWithTag:_imageTag];
    [previousButton setBackgroundImage:[UIImage imageNamed:_imageNames[_imageTag - 100]] forState:UIControlStateNormal];
    UILabel *previousLabel = (UILabel *)[self.view viewWithTag:_labelTag];
    previousLabel.textColor = [UIColor grayColor];
    //本次电击换图和字
    [button setBackgroundImage:[UIImage imageNamed:_selectedImageNames[button.tag - 100]] forState:UIControlStateNormal];
    UILabel *label = (UILabel *)[self.view viewWithTag:button.tag + 100];
    label.textColor = [UIColor colorWithRed:0 green:0.6 blue:1 alpha:1];
    //记录点击view的tag
    _imageTag = button.tag;
    _labelTag = button.tag + 100;
    
    
    self.selectedIndex = (button.tag - 100);
}


@end

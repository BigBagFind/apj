//
//  CatalogAllView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "CatalogAllView.h"

@implementation CatalogAllView

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles ContentViews:(NSArray *)contentViews{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentViews = contentViews;
        self.titles = titles;
        [self _createSubviews];
    }
    return self;
}



- (void)_createSubviews{
    //分类栏
    UIView *categoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    categoryView.backgroundColor = [UIColor whiteColor];
    [self addSubview:categoryView];
    CGFloat itemWidth = kScreenWidth / self.titles.count;
    for (NSInteger i = 0; i < self.titles.count; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * itemWidth,0, itemWidth,categoryView.height)];
        [categoryView addSubview:button];
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
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
    _scrollView.contentSize = CGSizeMake(kScreenWidth * self.titles.count, _scrollView.height);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    //内容视图
    for (NSInteger i = 0; i < self.titles.count; i ++) {
        UIView *view = self.contentViews[i];
        view.left = i * kScreenWidth;
        [_scrollView addSubview:view];
    }
    
}


- (void)selectedAction:(UIButton *)button{
    //先取消上一次的颜色
    UIButton *previousButton = (UIButton *)[self viewWithTag:_selectTag];
    [previousButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //设置选中选项
    [button setTitleColor:[UIColor colorWithRed:40.0 / 255.0 green:142.0 / 255.0 blue:238.0 / 255.0 alpha:1] forState:UIControlStateNormal];
    CGFloat itemWidth = kScreenWidth / self.titles.count;
    //拿到对应商品列表
    [UIView animateWithDuration:0.3 animations:^{
        _selectedView.left = (button.tag - 300) * itemWidth;
        [_scrollView setContentOffset:CGPointMake((button.tag - 300) * kScreenWidth, 0)];
    }];
    _selectTag = button.tag;
   
    
}

#pragma mark-滑动视图代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _selectedView.left = scrollView.contentOffset.x / self.titles.count;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
    UIButton *button = (UIButton *)[self viewWithTag:index + 300];
    [self selectedAction:button];
}

@end

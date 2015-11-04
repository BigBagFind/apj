//
//  BasePushViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/31.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "BasePushViewController.h"

@implementation BasePushViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self _setNavItems];
}

- (void)_setNavItems{
    //左边按钮
    UIButton *leftItem = [UIButton buttonWithType:UIButtonTypeCustom];
    leftItem.frame = CGRectMake(0, 0, 30, 30);
    [leftItem setImage:[UIImage imageNamed:@"arrow_white_l"] forState:UIControlStateNormal];
    [leftItem addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftItem];
}

- (void)leftAction{
    self.navigationController.navigationBar.translucent = YES;
    UIImage *image = [UIImage imageNamed:@"bg_clear"];
    [self.navigationController.navigationBar setBackgroundImage:image
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:image];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end

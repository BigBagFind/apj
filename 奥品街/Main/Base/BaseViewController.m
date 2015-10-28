//
//  BaseViewController.m
//  XSWeibo
//
//  Created by apple on 15/9/7.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    //16 111 222
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:39.0 / 255.0 green:142.0 / 255.0 blue:241.0 / 255.0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:236 / 255.0 alpha:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

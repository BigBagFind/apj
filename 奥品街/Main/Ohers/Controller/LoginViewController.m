//
//  LoginViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
}

- (void)leftAction{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end

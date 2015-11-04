//
//  BaseViewController.m
//  XSWeibo
//
//  Created by apple on 15/9/7.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController (){
    MBProgressHUD *_HUD;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    //16 111 222
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:39.0 / 255.0 green:142.0 / 255.0 blue:241.0 / 255.0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:236 / 255.0 alpha:1];
}

#pragma mark-第三方加载
//第三方加载
- (void)showHUD:(NSString *)title{
    
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _HUD.mode = MBProgressHUDModeIndeterminate;
    _HUD.yOffset = -30;
    _HUD.cornerRadius = 10;
    
    [_HUD show:YES];
    _HUD.labelColor = [UIColor colorWithRed:39.0 / 255.0 green:142.0 / 255.0 blue:241.0 / 255.0 alpha:1];
    _HUD.labelText = title;
    
}
- (void)hideHUD{
    [_HUD hide:YES];
}
- (void)completeHUD:(NSString *)title{
    _HUD.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"complete@2x"]];
    _HUD.mode = MBProgressHUDModeCustomView;
    _HUD.labelText = title;
    [_HUD hide:YES afterDelay:1.5];
}

@end

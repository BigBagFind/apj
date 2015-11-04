//
//  ResultSearchView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ResultSearchView.h"

@implementation ResultSearchView



- (void)cancelAction:(UIButton *)button{
    self.searchField.text = nil;
    self.hidden = YES;
    self.viewController.navigationController.navigationBarHidden = NO;
    [self.searchField resignFirstResponder];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //隐藏视图，重新加载
    self.hidden = YES;
    self.viewController.navigationController.navigationBarHidden = NO;
    [self.searchField resignFirstResponder];
    if (self.transportText) {
        self.transportText(self.searchField.text);
    }
    self.searchField.text = nil;
    
    return YES;
}

@end

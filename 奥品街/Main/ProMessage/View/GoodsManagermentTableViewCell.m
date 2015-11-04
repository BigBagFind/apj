//
//  GoodsManagermentTableViewCell.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "GoodsManagermentTableViewCell.h"

@implementation GoodsManagermentTableViewCell
- (IBAction)downShelfAction:(UIButton *)sender {
    //警告视图弹出
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认提示" message:@"是否确定下架这个商品" preferredStyle:UIAlertControllerStyleAlert];
    [self.viewController.navigationController presentViewController:alert animated:YES completion:nil];
    //取消
    UIAlertAction *cancelAciton = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    //确定
    UIAlertAction *sureAciton = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
    }];
    [alert addAction:cancelAciton];
    [alert addAction:sureAciton];
}

@end

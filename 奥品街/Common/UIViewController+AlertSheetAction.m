//
//  UIViewController+AlertSheetAction.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/30.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "UIViewController+AlertSheetAction.h"

@implementation UIViewController (AlertSheetAction)


- (void)appearAlertController{
    [self _configureSelf];
}


- (void)_configureSelf{
    //盖层
    UIView *maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    maskView.backgroundColor = [UIColor colorWithRed:83 / 255.0 green:83 / 255.0 blue:83 / 255.0 alpha:0.5];
    maskView.hidden = YES;
    [self.view addSubview:maskView];
    //警告视图弹出
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:alert animated:YES completion:nil];
    //定义picker
    __block UIImagePickerControllerSourceType sourceType;
     PickerViewController *picker = [[PickerViewController alloc]init];
    //取消选项
    UIAlertAction *cancelAciton = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        maskView.hidden = YES;
    }];
    //拍照
    UIAlertAction *takeAciton = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        maskView.hidden = YES;
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
        //无前置摄像头提示
        if (!isCamera) {
            UIAlertController *tipAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"摄像头无法使用！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAciton = [UIAlertAction actionWithTitle:@"好的，我马上买新手机" style:UIAlertActionStyleCancel handler:nil];
            [tipAlert addAction:cancelAciton];
            [self presentViewController:tipAlert animated:YES completion:nil];
            return;
        }
        //相机跳出
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    
    //相册弹出
    UIAlertAction *selectAciton = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        maskView.hidden = YES;
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    [alert addAction:cancelAciton];
    [alert addAction:takeAciton];
    [alert addAction:selectAciton];
}

//选图结束
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end

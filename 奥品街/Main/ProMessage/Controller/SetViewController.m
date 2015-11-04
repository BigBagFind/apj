//
//  SetViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self _initData];
    [self _createTable];
}

- (void)_initData{
    _images = @[@"set_message@2x",@"set_delete@2x",@"set_evaluate@2x"];
    _titles = @[@"消息设置",@"清除缓存",@"给我评价"];
}

- (void)_createTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.sectionFooterHeight = 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:_images[indexPath.row]];
        cell.textLabel.text = _titles[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, kScreenWidth, cell.height);
        [button setTitle:@"退出当前账户" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:39.0 / 255.0 green:142.0 / 255.0 blue:241.0 / 255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:button];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(quitCurrentCount) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            SetMessageViewController *setMsg = [[SetMessageViewController alloc]init];
            setMsg.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:setMsg animated:YES];
        }else if(indexPath.row == 1){
            [self showHUD:@"清除中..."];
            [self removeCachesFile];
            [self performSelector:@selector(completeHUD:) withObject:@"缓存清除完毕" afterDelay:1.5];
        }else if(indexPath.row == 2){
            [self showHUD:@"暂不开放"];
            [self completeHUD:@"暂不开放"];
        }
    }
}

#pragma mark-退出帐号事件
- (void)quitCurrentCount{
    NSLog(@"退出了当前帐号");
}

#pragma mark-移除缓存
- (void)removeCachesFile{
    
    NSString *homePath = NSHomeDirectory();
    NSString *filePath = @"/Library/Caches/";
    NSString *subFile = [homePath stringByAppendingString:filePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:subFile error:nil];
    for (NSString *fileName in fileNames) {
        NSString *file = [subFile stringByAppendingString:fileName];
        [fileManager removeItemAtPath:file error:nil];
    }
}

@end

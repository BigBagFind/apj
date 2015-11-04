//
//  RegistViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/4.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    UITableView *_tableView;
    GreySearchTextField *_phoneNumber;
    GreySearchTextField *_password;
    GreySearchTextField *_checkWord;
    UIButton *_sendMsg;
    NSTimer *_timer;
}

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机注册";
    [self _createTable];

}

- (void)_createTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 210) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.sectionFooterHeight = 0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //＋86
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 50, 50)];
        leftLabel.text = @"+86";
        leftLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:leftLabel];
        //竖线
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(leftLabel.right, 0, 1, 50)];
        line.backgroundColor = [UIColor colorWithRed:234 / 255.0 green:234 / 255.0 blue:236 / 255.0 alpha:1];
        [cell.contentView addSubview:line];
        //中国
        UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(line.right, 0, kScreenWidth - 70 - 1 - 20, 50)];
        rightLabel.text = @"中国";
        rightLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:rightLabel];
    }else if(indexPath.row == 1){
        UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_phone"]];
        leftImage.frame = CGRectMake(0, 0, 20, 20);
        _phoneNumber = [[GreySearchTextField alloc]initWithFrame:CGRectMake(10, 12,kScreenWidth - 20,30) IconView:leftImage];
        _phoneNumber.delegate = self;
        _phoneNumber.placeholder = @"请输入手机号码";
        _phoneNumber.keyboardType = UIKeyboardTypeNumberPad;
        _phoneNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
        [cell.contentView addSubview:_phoneNumber];
    }else if(indexPath.row == 2){
        UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_key"]];
        leftImage.frame = CGRectMake(0, 0, 20, 20);
        _password = [[GreySearchTextField alloc]initWithFrame:CGRectMake(10, 12,kScreenWidth - 20,30) IconView:leftImage];
        _password.delegate = self;
        _password.secureTextEntry = YES;
        _password.clearButtonMode = UITextFieldViewModeWhileEditing;
        _password.placeholder = @"请输入密码";
        [cell.contentView addSubview:_password];
    }else if(indexPath.row == 3){
        //验证码输入框
        UIImageView *leftImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_key"]];
        leftImage.frame = CGRectMake(0, 0, 20, 20);
        _checkWord = [[GreySearchTextField alloc]initWithFrame:CGRectMake(10, 12,180,30) IconView:leftImage];
        _checkWord.delegate = self;
        _checkWord.secureTextEntry = YES;
        _checkWord.keyboardType = UIKeyboardTypeNumberPad;
        _checkWord.clearButtonMode = UITextFieldViewModeWhileEditing;
        _checkWord.placeholder = @"请输入验证码";
        [cell.contentView addSubview:_checkWord];
        //发送短信按钮
        _sendMsg = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendMsg.frame = CGRectMake(kScreenWidth - 110, 10, 100, 30);
        [_sendMsg setTitle:@"发送验证码" forState:UIControlStateNormal];
        _sendMsg.titleLabel.font = [UIFont systemFontOfSize:12];
        [_sendMsg setTitle:@"60s秒后重新发送" forState:UIControlStateSelected];
        [_sendMsg setBackgroundImage:[UIImage imageNamed:@"bg_btn_b"] forState:UIControlStateNormal];
        [_sendMsg setBackgroundImage:[UIImage imageNamed:@"bg_btn_a"] forState:UIControlStateSelected];
        [_sendMsg addTarget:self action:@selector(sendMsg:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:_sendMsg];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendMsg:(UIButton *)button{
    button.selected = YES;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countSixty) userInfo:nil repeats:YES];
    button.userInteractionEnabled = NO;
    
}

- (void)countSixty{
    static NSInteger number = 10;
    if (number == 0) {
        _sendMsg.userInteractionEnabled = YES;
        _sendMsg.selected = NO;
        number = 10;
        [_timer invalidate];
        [_sendMsg setTitle:@"10s秒后重新发送" forState:UIControlStateSelected];
        return;
    }
    number --;
    NSString *string = [NSString stringWithFormat:@"%lds秒后重新发送",number];
    [_sendMsg setTitle:string forState:UIControlStateSelected];
}

- (void)viewWillDisappear:(BOOL)animated{
    if (_timer.valid) {
        NSLog(@"有效");
    }
    
    //[NSUserDefaults standardUserDefaults]
    
}

@end

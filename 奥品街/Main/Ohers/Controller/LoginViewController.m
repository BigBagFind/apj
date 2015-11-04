//
//  LoginViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    UITableView *_tableView;
    GreySearchTextField *_phoneNumber;
    GreySearchTextField *_password;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self _setNavItems:@"登录"];
    [self _createTable];
    [self _createButtons];
    
}

- (void)_setNavItems:(NSString *)titile{
    UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    rightItem.frame = CGRectMake(0, 0, 30, 20);
    [rightItem setTitle:titile forState:UIControlStateNormal];
    rightItem.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightItem addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightItem];
}

- (void)viewDidAppear:(BOOL)animated{
    [_phoneNumber becomeFirstResponder];
}


- (void)_createTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 160) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.sectionFooterHeight = 0;
    
}

- (void)_createButtons{
    //忘记密码   //注册帐号
    NSArray *texts = @[@"注册帐号",@"忘记密码"];
    for (NSInteger i = 0; i < 2; i++) {
        UIButton * forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:forgetBtn];
        forgetBtn.backgroundColor = [UIColor clearColor];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:texts[i]];
        NSRange contentRange = {0, [attString length]};
        NSDictionary *dic = @{
                              NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle],
                              NSForegroundColorAttributeName : [UIColor lightGrayColor],
                              NSFontAttributeName : [UIFont systemFontOfSize:15],
                              };
        [attString addAttributes:dic range:contentRange];
        [forgetBtn setAttributedTitle:attString forState:UIControlStateNormal];
        forgetBtn.tag = 100 + i;
        [forgetBtn addTarget: self action:@selector(forgetOrRegistAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 1) {
            forgetBtn.frame  = CGRectMake(kScreenWidth - 90, _tableView.bottom + 15, 80, 30);
        }else if(i == 0){
            forgetBtn.frame  = CGRectMake(10, _tableView.bottom + 15, 80, 30);
        }
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
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
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark-按钮点击事件
- (void)leftAction{
    [_phoneNumber resignFirstResponder];
    [_password resignFirstResponder];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)rightAction{
    NSLog(@"右边被点");
}

- (void)forgetOrRegistAction:(UIButton *)button{
    if (button.tag == 100) {
        RegistViewController *registVc = [[RegistViewController alloc]init];
        [self.navigationController pushViewController:registVc animated:YES];
    }
}


@end

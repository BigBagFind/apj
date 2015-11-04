//
//  AboutApjViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/31.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "AboutApjViewController.h"

@implementation AboutApjViewController



- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"关于奥品街";
    [self _createSubviews];
    
}


- (void)_createSubviews{
    NSString *textString = @"奥品街是一海外代购APP软件特别提醒用户认真阅读、充 分理解本《奥品街用户服务协议》(以下简称《协议》)中各条款,包括免除或者限制杭州久尚科技有限公司责任的免责条款及对用户的权利限制条款。\n请您审慎阅读并选择接受或不接受本《协议》。除非您接受本《协议》所有条款,否则您无权注册、登录或使用本协议所涉相关服务。您的注册、登录、使用等行为将视为对本《协议》的接受,并同意接受本《协议》各项条款的约束。\n本《协议》描述服务相关方面的权利义务。“用户”是指注册、登录、使用、浏览本服务的个人或组织。本《协议》可由 杭州久尚科技有限公司随时更新,更新后的协议条款一旦公布即代替原来的协议条款,恕不再另行通知,用户可在本网站查阅最新版协议条款。在有限公司修改《协议》条款后,如果用户不接受修改后的条款,请立即停止使用杭州久尚科技有限公司提供的服务,用户继续使用提供的服务将被视为已接受了修改后的协议。";
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, kScreenHeight - 64)];
    [self.view addSubview:textView];
    textView.backgroundColor = [UIColor clearColor];
    textView.font = [UIFont systemFontOfSize:14];
    textView.textColor = [UIColor darkGrayColor];
    textView.editable = NO;
    textView.showsVerticalScrollIndicator = NO;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [textString length])];
    textView.attributedText = attributedString;
    paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
    
}




@end


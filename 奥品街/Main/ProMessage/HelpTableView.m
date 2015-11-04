//
//  HelpTableView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/31.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "HelpTableView.h"
static NSString *identity = @"detailHelpCell";
@implementation HelpTableView



- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initData];
        [self _configurateSelf];
        [self registerNib:[UINib nibWithNibName:@"DetailHelpCell" bundle:nil] forCellReuseIdentifier:identity];
    }
    return self;
}

- (void)_initData{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"HelpCenterList" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    _listTitles = [dic allKeys];
    _listcontents = [dic allValues];
}

- (void)_configurateSelf{
    self.delegate = self;
    self.dataSource = self;
    self.rowHeight = 50;
    self.tableFooterView = [[UIView alloc]init];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _listTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (stateOfopen[section]) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailHelpCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    cell.text = _listcontents[indexPath.section];
    cell.backgroundColor = [UIColor clearColor];
    return  cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HelpSectionHeaderButoon *button = [[HelpSectionHeaderButoon alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    button.backgroundColor = [UIColor whiteColor];
    button.tag = section + 200;
    button.label.text = _listTitles[section];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //计算高度
    CGFloat height = [TggEasyTextTool tggEasyGetTextHeightWithText:_listcontents[indexPath.section] width:kScreenWidth fontSize:14 linespace:5];
    return height;
}

- (void)buttonAction:(HelpSectionHeaderButoon *)button{
    NSInteger section = button.tag - 200;
    //刷新单元格
    stateOfopen[section] = !stateOfopen[section];
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    //变色
    if (_selectedButton != nil) {
        _selectedButton.circleView.image = [UIImage imageNamed:@"circle_grey@2x"];
        _selectedButton.label.textColor = [UIColor darkGrayColor];
    }
    HelpSectionHeaderButoon *currentButton = (HelpSectionHeaderButoon *)[self viewWithTag:button.tag];
    currentButton.circleView.image = [UIImage imageNamed:@"circle_blue@2x"];
    currentButton.label.textColor = [UIColor colorWithRed:0 green:143 / 255.0 blue:242 / 255.0 alpha:1];
    _selectedButton = currentButton;
    
}


@end

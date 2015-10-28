



//
//  CountryView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "CountryView.h"
static NSString *identity = @"CountryCell";
@implementation CountryView



- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = 41;
        self.bounces = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        _names = @[@"澳大利亚",
                   @"美国",
                   @"日本"];
        _images = @[@"country_aus",
                    @"country_usa",
                    @"country_jap"];
        UIImageView *separator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"country_line"]];
        separator.frame = CGRectMake(8, 41, 85, 1);
        [self addSubview:separator];
        UIImageView *separator1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"country_line"]];
        separator1.frame = CGRectMake(8, 82, 85, 1);
        [self addSubview:separator1];
    }
    return self;
}



#pragma mark-表示图数据元代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
       
        cell.backgroundColor = [UIColor clearColor];
    }
    //国旗
    UIImageView *countryIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_images[indexPath.row]]];
    countryIcon.frame = CGRectMake(10, 7, 30, 30);
    [cell.contentView addSubview:countryIcon];
    //国名
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, cell.height)];
    label.text = _names[indexPath.row];
    label.left = countryIcon.right + 5;
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:11];
    [cell.contentView addSubview:label];
    return cell;
}

@end

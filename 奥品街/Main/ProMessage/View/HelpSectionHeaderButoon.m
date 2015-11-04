
//
//  HelpSectionHeaderButoon.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/1.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "HelpSectionHeaderButoon.h"

@implementation HelpSectionHeaderButoon




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubviews];
    }
    return self;
}

- (void)_createSubviews{
    //下划线
    UIView  *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 0.5, kScreenWidth, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    //竖线
    self.verticalLine = [[UIView alloc]initWithFrame:CGRectMake(15, 0, 1, self.height)];
    self.verticalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.verticalLine];
    //圆点
    self.circleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"circle_grey@2x"]];
    [self addSubview:self.circleView];
    self.circleView.backgroundColor = [UIColor whiteColor];
    self.circleView.frame = CGRectMake(11.5, (self.height - 9) / 2, 9, 9);
    //标题
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(self.circleView.left + 15, 0, self.width - self.circleView.left - 15, self.height)];
    self.label.font = [UIFont systemFontOfSize:13];
    self.label.textColor = [UIColor darkGrayColor];
    [self addSubview:self.label];
}



@end

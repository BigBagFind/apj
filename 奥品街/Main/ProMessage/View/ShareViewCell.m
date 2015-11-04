//
//  ShareViewCell.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/2.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ShareViewCell.h"

@implementation ShareViewCell


- (void)setImageName:(NSString *)imageName{
    if (_imageName != imageName) {
        _imageName = imageName;
        [self setNeedsLayout];
    }
}

- (void)setTitle:(NSString *)title{
    if (_title != title) {
        _title = title;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = (self.width - 60) / 2;
    CGFloat length = (self.height - 60) /2;
    //图标
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(width, length, 60, 60)];
    [self.contentView addSubview:_iconView];
    _iconView.image = [UIImage imageNamed:self.imageName];
    //标题
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(width, _iconView.bottom + 5, 60, 10)];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.font = [UIFont systemFontOfSize:11];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = self.title;
}



@end

//
//  AttentionButton.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "AttentionButton.h"

@implementation AttentionButton

- (void)awakeFromNib{
    
    [self setTitle:@" 关注" forState:UIControlStateNormal];
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setImage:[UIImage imageNamed:@"collect_a@2x"] forState:UIControlStateNormal];
    self.titleEdgeInsets = UIEdgeInsetsMake(2,0, 0, 0);
    [self addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
}


- (void)setAttention:(BOOL)attention{
    if (attention) {
        [self setTitle:@"已关注" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:39.0 / 255.0 green:142.0 / 255.0 blue:241.0 / 255.0 alpha:1] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"collect_b@2x"] forState:UIControlStateNormal];
    }else{
       
        [self setTitle:@" 关注" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"collect_a@2x"] forState:UIControlStateNormal];

    }
}

- (void)action{
    self.selected = !self.selected;
    [self setAttention:self.selected];
}

@end

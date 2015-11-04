//
//  OrdersCell.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "OrdersCell.h"

@implementation OrdersCell

- (void)awakeFromNib {
    PurchasedGoodView *goodsView = [[[NSBundle mainBundle] loadNibNamed:@"PurchasedGoodView" owner:self options:nil] lastObject];
    goodsView.frame = CGRectMake(0, 40, kScreenWidth, 75);
    [self.contentView addSubview:goodsView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end

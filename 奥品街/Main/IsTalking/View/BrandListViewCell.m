//
//  BrandListViewCell.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "BrandListViewCell.h"

@implementation BrandListViewCell

- (IBAction)AttentionAction:(AttentionButton *)sender {
    sender.selected = !sender.selected;
    [sender setAttention:sender.selected];
}



@end

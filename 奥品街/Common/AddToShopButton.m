//
//  AddToShopButton.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/4.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "AddToShopButton.h"

@implementation AddToShopButton


- (void)awakeFromNib{
    
    [self setBackgroundImage:[UIImage imageNamed:@"add_a"] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)addToShop:(BOOL)isAdding{
    if(isAdding) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"add_b"] forState:UIControlStateNormal];
    }else{
        
        [self setBackgroundImage:[UIImage imageNamed:@"add_a"] forState:UIControlStateNormal];
    }
}

- (void)action{
    self.selected = !self.selected;
    [self addToShop:self.selected];
    NSLog(@"111");
}


@end

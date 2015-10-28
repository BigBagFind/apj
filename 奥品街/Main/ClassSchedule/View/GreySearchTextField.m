//
//  GreySearchTextField.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "GreySearchTextField.h"

@implementation GreySearchTextField



//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect{
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                 NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 };
    [self.placeholder drawInRect:rect withAttributes:attributes];
    
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect edtingtRect = [super editingRectForBounds:bounds];
    edtingtRect.origin.x += 10;
    return edtingtRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect textRect = [super placeholderRectForBounds:bounds];
    textRect.origin.x -= 10;
    return textRect;
    
}


@end

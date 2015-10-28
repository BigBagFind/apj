//
//  SearchTextField.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "SearchTextField.h"

@implementation SearchTextField

- (instancetype)initWithFrame:(CGRect)frame IconView:(UIImageView*)icon{
    if (self = [super initWithFrame:frame]) {
        self.leftView = icon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 10;// 右偏10
    return iconRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect textRect = [super placeholderRectForBounds:bounds];
    textRect.origin.x += 10;
    textRect.origin.y += 9;
    return textRect;
}

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect{
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:[UIColor whiteColor],
                                 NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 };
    [self.placeholder drawInRect:rect withAttributes:attributes];
    
}

- (CGRect)textRectForBounds:(CGRect)bounds{
    CGRect textRect = [super textRectForBounds:bounds];
    textRect.origin.x += 10;
    return textRect;
}

@end

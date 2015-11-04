//
//  DetailHelpCell.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/1.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "DetailHelpCell.h"

@implementation DetailHelpCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}


- (void)setText:(NSString *)text{
    if (_text != text) {
        _text = text;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = [UIFont systemFontOfSize:14];
    _textView.textColor = [UIColor darkGrayColor];
    _textView.editable = NO;
    _textView.showsVerticalScrollIndicator = NO;
    NSString *textString = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textString];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [textString length])];
    _textView.attributedText = attributedString;
    
}


@end

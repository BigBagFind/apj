//
//  TggEasyTextTool.m
//  TggEasyGetTextHeight
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "TggEasyTextTool.h"

@implementation TggEasyTextTool


+ (CGFloat)tggEasyGetTextHeightWithText:(NSString *)text
                                  width:(CGFloat)width
                               fontSize:(CGFloat)fontSize
                              linespace:(CGFloat)linespace{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:linespace];
    NSDictionary *attributes  = @{
                                  NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                                  NSParagraphStyleAttributeName : paragraphStyle
                                  };
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return rect.size.height;
}

@end

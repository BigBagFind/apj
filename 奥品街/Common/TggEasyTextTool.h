//
//  TggEasyTextTool.h
//  TggEasyGetTextHeight
//
//  Created by 吴玉铁 on 15/11/3.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TggEasyTextTool : NSObject


+ (CGFloat)tggEasyGetTextHeightWithText:(NSString *)text
                                  width:(CGFloat)width
                               fontSize:(CGFloat)fontSize
                              linespace:(CGFloat)linespace;

@end

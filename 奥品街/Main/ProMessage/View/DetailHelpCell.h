//
//  DetailHelpCell.h
//  奥品街
//
//  Created by 吴玉铁 on 15/11/1.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHelpCell : UITableViewCell

@property (nonatomic,copy) NSString *text;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

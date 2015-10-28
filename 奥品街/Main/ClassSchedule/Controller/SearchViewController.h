//
//  SearchViewController.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GreySearchTextField.h"

@interface SearchViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy)NSString *text;


@end

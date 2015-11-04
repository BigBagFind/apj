//
//  SearchResultViewController.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "BaseViewController.h"
#import "GreySearchTextField.h"
#import "SearchView.h"


@interface SearchResultViewController : BaseViewController<UITextFieldDelegate>

@property (nonatomic,copy) NSString *text;

@end

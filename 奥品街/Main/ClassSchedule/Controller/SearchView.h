//
//  SearchView.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/28.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GreySearchTextField.h"
#import "UIView+ViewController.h"
#import "SearchResultViewController.h"

@interface SearchView : UIView<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *_associateList;

}
@property (nonatomic,strong)GreySearchTextField *searchField;

- (void)cancelAction:(UIButton *)button;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end

//
//  ProMessageTableView.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/30.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+ViewController.h"
#import "AboutApjViewController.h"
#import "HelpCenterViewController.h"
#import "MyBalanceViewController.h"
#import "GoodsManagementViewController.h"
#import "StoreManagementViewController.h"

@interface ProMessageTableView : UITableView<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_titles;
    NSArray *_icons;
    
}


@end

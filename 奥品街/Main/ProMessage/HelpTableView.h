//
//  HelpTableView.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/31.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailHelpCell.h"
#import "HelpSectionHeaderButoon.h"
#import "TggEasyTextTool.h"

@interface HelpTableView : UITableView<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_listTitles;
    NSArray *_listcontents;
    BOOL stateOfopen[10];
    HelpSectionHeaderButoon *_selectedButton;
}



@end

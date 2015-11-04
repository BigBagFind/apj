//
//  ResultSearchView.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchView.h"
#import "SearchResultViewController.h"
typedef void(^TransportText)(NSString *);

@interface ResultSearchView : SearchView

@property (nonatomic,copy)TransportText transportText;

@end

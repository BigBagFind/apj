//
//  CatalogAllView.h
//  奥品街
//
//  Created by 吴玉铁 on 15/10/29.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatalogAllView : UIView<UIScrollViewDelegate>{
    UIImageView *_selectedView;
    NSInteger _selectTag;
    UIScrollView *_scrollView;
}

@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *contentViews;

- (instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles ContentViews:(NSArray *)contentViews;


@end

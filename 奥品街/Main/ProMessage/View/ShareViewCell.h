//
//  ShareViewCell.h
//  奥品街
//
//  Created by 吴玉铁 on 15/11/2.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *title;


@end

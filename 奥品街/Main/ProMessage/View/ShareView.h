//
//  ShareView.h
//  奥品街
//
//  Created by 吴玉铁 on 15/11/2.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewCell.h"

@interface ShareView : UIView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSArray *_images;
    NSArray *_titles;
    UIView *_maskView;
}




@end

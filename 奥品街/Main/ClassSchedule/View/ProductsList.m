//
//  ProductsList.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ProductsList.h"
static NSString *identity = @"productCell";
@implementation ProductsList

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if ([super initWithFrame:frame collectionViewLayout:layout]) {
        UINib *nib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:identity];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上坐下右
    return UIEdgeInsetsMake(5, 0, 5, 0);
    
}


@end

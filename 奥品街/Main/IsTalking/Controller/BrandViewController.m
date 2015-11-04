//
//  BrandViewController.m
//  奥品街
//
//  Created by 吴玉铁 on 15/10/27.
//  Copyright © 2015年 铁哥. All rights reserved.
//
#import "BrandViewController.h"
static NSString *identity = @"brandCell";
@interface BrandViewController ()

@end

@implementation BrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"品牌";
    [self _createSubviews];
}

- (void)_createSubviews{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格大小
    CGFloat width = (kScreenWidth - 20 * 6) / 3;
    layout.itemSize = CGSizeMake(width, width);
    UICollectionView *brandsView = [[UICollectionView alloc] initWithFrame:CGRectMake( 0, 0, kScreenWidth, kScreenHeight - 64) collectionViewLayout:layout];
    brandsView.dataSource = self;
    brandsView.delegate = self;
    brandsView.backgroundColor = [UIColor clearColor];
    [brandsView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identity];
    [self.view addSubview:brandsView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"border_white"]];
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上坐下右
    return UIEdgeInsetsMake( 20, 20, 20, 20);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BrandListViewController *brandListVc = [[BrandListViewController alloc]init];
    brandListVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:brandListVc animated:YES];
    //手势打开
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
}
@end

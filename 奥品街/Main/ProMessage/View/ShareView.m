//
//  ShareView.m
//  奥品街
//
//  Created by 吴玉铁 on 15/11/2.
//  Copyright © 2015年 铁哥. All rights reserved.
//

#import "ShareView.h"
static NSString *identity = @"shareCell";
@implementation ShareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initData];
        [self _createSubviews];
    }
    return self;
}

- (void)_initData{
    _images = @[@"share_friend@2x",@"share_qqzone@2x",@"share_sina@2x",@"share_wechat@2x",@"share_qq@2x"];
    _titles = @[@"朋友圈",@"QQ空间",@"微博好友",@"微信好友",@"QQ好友"];
}

- (void)_createSubviews{
    //maskView
//    _maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    _maskView.backgroundColor = [UIColor colorWithRed:83 / 255.0 green:83 / 255.0 blue:83 / 255.0 alpha:0.5];
//    _maskView.hidden = YES;
   // [self addSubview:_maskView];
    //collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (kScreenWidth - 20) / 3;
    layout.itemSize = CGSizeMake(width, width - 20);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, width * 2 - 20) collectionViewLayout:layout];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:collectionView];
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    [collectionView registerClass:[ShareViewCell class] forCellWithReuseIdentifier:identity];
    collectionView.backgroundColor = [UIColor colorWithRed:225 / 255.0 green:225 / 255.0 blue:226 / 255.0 alpha:0.9];
    //line
    UIView  *line = [[UIView alloc]initWithFrame:CGRectMake(0, collectionView.bottom - 0.5, kScreenWidth, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    //CancelView
    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, line.bottom, kScreenWidth, 50)];
    cancelBtn.backgroundColor = [UIColor colorWithRed:233 / 255.0 green:233 / 255.0 blue:234 / 255.0 alpha:1];
    [self addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ShareViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    cell.title = _titles[indexPath.row];
    cell.imageName = _images[indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //上坐下右
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"touchCollection");
}

#pragma mark-取消按钮时间
- (void)cancelAction{
    [[NSNotificationCenter defaultCenter] postNotificationName:kHideShareView object:nil];
}


@end

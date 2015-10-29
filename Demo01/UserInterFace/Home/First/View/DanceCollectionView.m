//
//  DanceCollectionView.m
//  Demo01
//
//  Created by Deo on 15/10/12.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "DanceCollectionView.h"

#import "DanceModel.h"
#import "VideoCollectionCell.h"
#import "UIView+UIViewController.h"
#import "userDanceViewController.h"
#define kVideoCollectionCellIdentifier @"k_Video_Collection_Cell_Identifier"
@implementation DanceCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.data=[NSArray array];
        
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor clearColor];
        
        [self registerNib:[UINib nibWithNibName:@"VideoCollectionCell" bundle:nil] forCellWithReuseIdentifier:kVideoCollectionCellIdentifier];

    }
    return self;
}
#pragma mark - UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kVideoCollectionCellIdentifier forIndexPath:indexPath];
    
    cell.model=self.data[indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    userDanceViewController *use = [[userDanceViewController alloc]init];
    [self.viewController.navigationController pushViewController:use animated:YES];
}

- (void)setData:(NSArray *)data{
    _data=data;
    
    [self reloadData];
}

@end

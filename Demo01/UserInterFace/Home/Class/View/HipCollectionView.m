//
//  HipCollectionView.m
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "HipCollectionView.h"

#import "HipCollectionViewCell.h"

#define kHipHopCollectionViewCellIdentifier @"kHipHop_CollectionView_Cell_ID"

@implementation HipCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        _data=[NSArray array];
        self.backgroundColor=[UIColor whiteColor];
        self.delegate=self;
        self.dataSource=self;
        [self registerNib:[UINib nibWithNibName:@"HipCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kHipHopCollectionViewCellIdentifier];
        [self requestData];
    }
    return self;
}

- (void)requestData{
    self.data=@[@"左图2@_1",@"右图2@_1",@"左图2@_2",@"右图2@_2",@"左图2@_3",@"右图2@_3"];
    [self reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HipCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kHipHopCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.postImgView.image=[UIImage imageNamed:self.data[indexPath.item]];
    return cell;
}

@end

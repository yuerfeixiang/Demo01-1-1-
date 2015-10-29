//
//  StateCollectionView.m
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "StateCollectionView.h"
#import "StateCollectionViewCell.h"

#define kStateCollectionViewCellIdentifier @"kState_Collection_View_Cell_Identifier"
@implementation StateCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor clearColor];
        [self registerNib:[UINib nibWithNibName:@"StateCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kStateCollectionViewCellIdentifier];
    }
    
    return self;
}

#pragma  mark - CollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StateCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kStateCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor whiteColor];
    cell.model=self.data[indexPath.row];
    return cell;
    
}

#pragma  mark - Collection Delegate



@end

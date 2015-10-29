//
//  ClassCollectionView.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "ClassCollectionView.h"
#import "ClassModel.h"
#import "ClassCollectionCell.h"
#import "LastestViewController.h"
#import "HipHopViewController.h"

#import "UIView+UIViewController.h"
#define kClassCollectionCellIdentifier @"k_Class_Collection_Cell_Identifier"

@implementation ClassCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor whiteColor];
        self.scrollEnabled=NO;
        self.data=[NSMutableArray array];
        [self registerNib:[UINib nibWithNibName:@"ClassCollectionCell" bundle:nil] forCellWithReuseIdentifier:kClassCollectionCellIdentifier];

        [self requestData];
    }
    
    return self;
}

- (void)requestData{
    
    _titleArr=@[@"最新",@"街舞",@"民族舞",@"国际舞",@"古典舞",@"芭蕾舞",@"现代舞",@"广场舞",@"鬼步舞",@"MV舞蹈"];
    
    NSArray *imgNameArr=@[@"最新2@",@"街舞2@",@"民族舞2@",@"国标舞2@",@"古典舞2@",@"芭蕾舞2@",@"现代舞2@",@"广场舞2@",@"鬼步舞2@",@"MV舞蹈2@"];
    NSArray *enArr=@[@"New",@"Street dance",@"Folk dance",@"International dance",@"Classical dance",@"Ballet",@"Modern dance",@"Square dance",@"Shuffle",@"MV dance"];
    for (int i=0; i<_titleArr.count; i++) {
        ClassModel *model=[[ClassModel alloc]init];
        model.cnName=_titleArr[i];
        model.enName=enArr[i];
        model.imgName=imgNameArr[i];
        [self.data addObject:model];
    }
    
    [self reloadData];
}

#pragma mark - CollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ClassCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kClassCollectionCellIdentifier forIndexPath:indexPath];
    cell.model=self.data[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSDictionary *userInfo=@{@"indexpathItem":[NSNumber numberWithInteger:indexPath.item] };
//    
//    //发通知
//    [[NSNotificationCenter defaultCenter]postNotificationName:kPushNavigationControllerNotification
//                                                       object:nil
//                                                     userInfo:userInfo];
    if (indexPath.row==0) {
        LastestViewController *lastVC=[[LastestViewController alloc]init];
        [self.viewController.navigationController pushViewController:lastVC animated:YES];
    }else{
        HipHopViewController *hiphopVC=[[HipHopViewController alloc]init];
        hiphopVC.titleName=_titleArr[indexPath.item];
        [self.viewController.navigationController pushViewController:hiphopVC animated:YES];
    }
    
}

@end

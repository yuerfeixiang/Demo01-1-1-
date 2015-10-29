//
//  HipTableHeadView.m
//  Demo01
//
//  Created by Deo on 15/10/16.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "HipTableHeadView.h"
#import "HipCollectionView.h"

#import "UIViewExt.h"

#import "Common.h"
#import "BannerView.h"
@implementation HipTableHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    
    return self;
}

- (void)_createSubView{
    _bannerView=[[BannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 215)];
    _bannerView.bannerImgArr=@[@"左图2@_1",@"右图2@_1",@"右图2@_2",@"左图2@_3",@"右图2@_3"];
    [self addSubview:_bannerView];
    
    //介绍文本
    UILabel *introLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 219, kScreenWidth-20, 60)];
    introLabel.numberOfLines=3;
    introLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    introLabel.font=[UIFont systemFontOfSize:13];
    introLabel.text=@"街舞是起源于美国，基于不同的街头文化或音乐风格而产生的多个不同种类的舞蹈的统称，最早的街舞舞种为Locking，起源于20世纪六十年代......";
    [self addSubview:introLabel];
    
    //添加collectionView
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=1;
    layout.minimumLineSpacing=1;
    layout.sectionInset=UIEdgeInsetsMake(1, 1, 1, 1);
    layout.itemSize=CGSizeMake((kScreenWidth-3)/2, 104);
    CGRect frame=CGRectMake(0, introLabel.bottom, kScreenWidth, 315);
    HipCollectionView *hipCollectionView=[[HipCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    hipCollectionView.scrollEnabled=NO;//设置collection view的可滑动性
    [self addSubview:hipCollectionView];
  
    UIView *newView=[[UIView alloc]initWithFrame:CGRectMake(0, hipCollectionView.bottom, kScreenWidth, 44)];
    [self addSubview:newView];
   // 左边横线
    UIImageView *leftImgView=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-55-180)/2, 22, 90, 1)];
    leftImgView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [newView addSubview:leftImgView];
    
    //最新  标题
    UILabel *newLabel=[[UILabel alloc]initWithFrame:CGRectMake(leftImgView.right+10, 12, 35, 20)];
    newLabel.text=@"最新";
    newLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    newLabel.textAlignment=NSTextAlignmentCenter;
    newLabel.font=[UIFont systemFontOfSize:15];
    [newView addSubview:newLabel];
    
    //右边横线
    UIImageView *rightImgView=[[UIImageView alloc]initWithFrame:CGRectMake(newLabel.right+10, 22, 90, 1)];
    rightImgView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [newView addSubview:rightImgView];
}

@end

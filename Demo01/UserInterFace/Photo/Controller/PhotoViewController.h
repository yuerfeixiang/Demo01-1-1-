//
//  PhotoViewController.h
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (nonatomic,strong)UICollectionView *photoVc;
@property (nonatomic,strong)NSMutableArray *_dataArray;
@property (nonatomic,strong)NSMutableArray *_rollArray;
@end

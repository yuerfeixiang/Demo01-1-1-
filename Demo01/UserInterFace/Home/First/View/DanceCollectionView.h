//
//  DanceCollectionView.h
//  Demo01
//
//  Created by Deo on 15/10/12.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DanceCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSArray *data;

@end

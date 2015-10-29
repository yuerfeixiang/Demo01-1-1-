//
//  StateCollectionView.h
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StateCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSArray *data;
@end

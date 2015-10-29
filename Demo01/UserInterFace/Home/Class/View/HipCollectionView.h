//
//  HipCollectionView.h
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HipCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *data;

@end

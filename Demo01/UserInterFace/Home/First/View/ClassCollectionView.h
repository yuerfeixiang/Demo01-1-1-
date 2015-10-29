//
//  ClassCollectionView.h
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kPushNavigationControllerNotification @"kPushNavigationControllerNotification"
@interface ClassCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>{
    NSArray *_titleArr;
}
@property(nonatomic,retain)NSMutableArray *data;

@end

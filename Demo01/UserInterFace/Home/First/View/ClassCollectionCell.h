//
//  ClassCollectionCell.h
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClassModel;
@interface ClassCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property(nonatomic,strong)ClassModel *model;
@property (weak, nonatomic) IBOutlet UILabel *cnNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *enNameLabel;

@end

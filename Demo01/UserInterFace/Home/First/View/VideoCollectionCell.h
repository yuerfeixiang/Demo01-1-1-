//
//  VideoCollectionCell.h
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DanceModel;
@interface VideoCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImgView;

@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UILabel *decLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@property(nonatomic,strong)DanceModel *model;
@end

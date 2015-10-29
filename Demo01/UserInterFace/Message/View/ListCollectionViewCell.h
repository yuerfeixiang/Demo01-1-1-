//
//  ListCollectionViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/14.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;
@interface ListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avartImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property(nonatomic,strong)UILabel *infoLabel;
@property(nonatomic,strong)UIImageView *rightImgView;

@property(nonatomic,strong)MessageModel *model;
@end

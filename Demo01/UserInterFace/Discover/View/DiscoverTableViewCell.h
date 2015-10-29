//
//  DiscoverTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserModel;
@interface DiscoverTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avartImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImgView;
@property (weak, nonatomic) IBOutlet UILabel *interestLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *otherLabel;

@property(nonatomic,strong)UserModel *model;
@end

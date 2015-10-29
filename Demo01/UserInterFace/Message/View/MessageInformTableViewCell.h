//
//  MessageInformTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/27.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageInformTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avartImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImgView;
@property (weak, nonatomic) IBOutlet UIImageView *isVideoImgView;

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

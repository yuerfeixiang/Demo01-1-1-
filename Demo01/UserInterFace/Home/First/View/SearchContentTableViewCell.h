//
//  SearchUserTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchContentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postImgView;
@property (weak, nonatomic) IBOutlet UIImageView *avartImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImgView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;

@end

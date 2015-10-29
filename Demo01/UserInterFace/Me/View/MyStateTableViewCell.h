//
//  MyStateTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/19.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyStateTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIView *contView;
@property (weak, nonatomic) IBOutlet UIImageView *VideoImgView;
@property (weak, nonatomic) IBOutlet UIImageView *playImgView;

@end

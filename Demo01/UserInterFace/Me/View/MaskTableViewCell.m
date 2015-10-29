//
//  MaskTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/20.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MaskTableViewCell.h"

@implementation MaskTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    _userImgView.layer.cornerRadius=20;
    _nickLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    _maskLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    [_isMaskButton setImage:[UIImage imageNamed:@"粉丝加关注2@"] forState:UIControlStateNormal];
    [_isMaskButton setImage:[UIImage imageNamed:@"粉丝好友2@"] forState:UIControlStateSelected];
}



@end

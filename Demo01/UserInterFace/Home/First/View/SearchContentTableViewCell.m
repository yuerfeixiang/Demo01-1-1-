//
//  SearchUserTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "SearchContentTableViewCell.h"

#import "UIViewExt.h"

#import "Common.h"

@implementation SearchContentTableViewCell

- (void)awakeFromNib {
    
    _avartImgView.layer.cornerRadius=_avartImgView.height/2;
    _nickLabel.textColor=HEXCOLOR(0x656869);
    _descLabel.textColor=HEXCOLOR(0x939393);
    _timeLabel.textColor=HEXCOLOR(0xbcbcbc);
    _likeCountLabel.textColor=HEXCOLOR(0xbcbcbc);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

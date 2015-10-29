//
//  MessageInformTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/27.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MessageInformTableViewCell.h"
#import "Common.h"

@implementation MessageInformTableViewCell

- (void)awakeFromNib {
    _nickLabel.textColor=HEXCOLOR(0x656869);
    _contentLabel.textColor=HEXCOLOR(0x939393);
    _avartImgView.layer.cornerRadius=_avartImgView.height/2;
    _avartImgView.clipsToBounds=YES;
    _dataLabel.textColor=HEXCOLOR(0xbcbcbc);
    _timeLabel.textColor=HEXCOLOR(0xbcbcbc);
}



@end

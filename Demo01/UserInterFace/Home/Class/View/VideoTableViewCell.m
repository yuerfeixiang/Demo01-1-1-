//
//  VideoTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "VideoTableViewCell.h"
#import "UIViewExt.h"

@implementation VideoTableViewCell

- (void)awakeFromNib {
    _titleLabelTopConstraint=[NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:(self.height-48)/2.f];
    _detailLabel.textColor=[UIColor colorWithRed:202/255.0 green:204/255.0 blue:204/255.0 alpha:1];
    _titleLabel.text=@"街舞街舞";
}



@end

//
//  InformTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/22.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "InformTableViewCell.h"

@implementation InformTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    _infoListLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    _timeLabel.textColor=[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
}



@end

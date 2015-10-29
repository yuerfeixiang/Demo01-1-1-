//
//  MyStateTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/19.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MyStateTableViewCell.h"

@implementation MyStateTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    _timeLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    _descLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
}


@end

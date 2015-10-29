//
//  TagTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/20.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "TagTableViewCell.h"

@implementation TagTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    _nameLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    _nameLabel.text=@"#标签#";
}

@end

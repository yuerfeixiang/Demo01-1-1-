//
//  SearchTagTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "SearchTagTableViewCell.h"

#import "Common.h"

@implementation SearchTagTableViewCell

- (void)awakeFromNib {
    _countLabel.textColor=HEXCOLOR(0x939393);
    _tagNameLabel.textColor=HEXCOLOR(0x656869);
}



@end

//
//  SearchContentTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "SearchUserTableViewCell.h"

#import "Common.h"
#import "UIViewExt.h"

#define kSearchUserTableViewCellIdentifier @"k_Search_User_TableView_Cell_Identifier"

@implementation SearchUserTableViewCell

- (void)awakeFromNib {
    
    _nickLabel.textColor=HEXCOLOR(0x656869);
    _avatrtImgView.layer.cornerRadius=_avatrtImgView.height/2;
    _interestLabl.textColor=HEXCOLOR(0x939393);
    _introLabel.textColor=HEXCOLOR(0x939393);
}


@end

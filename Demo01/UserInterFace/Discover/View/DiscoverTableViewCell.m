//
//  DiscoverTableViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "DiscoverTableViewCell.h"

#import "UIViewExt.h"

#import "UserModel.h"
@implementation DiscoverTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    _avartImgView.layer.cornerRadius=_avartImgView.height/2;
    _avartImgView.clipsToBounds=YES;
    _nickLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    _interestLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    _introLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    _otherLabel.textColor=[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];


}

- (void)setModel:(UserModel *)model{
    _model=model;
    if (model.avatars.count==0) {
        _avartImgView.image=[UIImage imageNamed:@"通知2@"];
    }else{
        _avartImgView.image=[UIImage imageNamed:model.avatars[0]];
    }
    
}

@end

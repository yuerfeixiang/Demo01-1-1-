//
//  NewTopView.m
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "NewTopView.h"
#import "Common.h"

@implementation NewTopView

- (void)awakeFromNib{
    _detailLabel.textColor=[UIColor colorWithRed:202/255.0 green:204/255.0 blue:204/255.0 alpha:1];
    //_playImgConstraint=kScreenWidth;
    _titleLabel.text=@"街舞街舞";

}
@end

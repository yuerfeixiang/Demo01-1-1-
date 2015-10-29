//
//  ListCollectionViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/14.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "ListCollectionViewCell.h"

#import "UIViewExt.h"
#import "MessageModel.h"

@implementation ListCollectionViewCell

- (void)awakeFromNib {
    _avartImgView.layer.cornerRadius=_avartImgView.height/2;
    _avartImgView.clipsToBounds=YES;
    _nickLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    _messageLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    _timeLabel.textColor=[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
    
    
    _infoLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.avartImgView.right+12, 22, 50, 20)];
    _infoLabel.text=@"通知";
    _infoLabel.font=[UIFont systemFontOfSize:15];
    _infoLabel.hidden=YES;
    _infoLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    [self.contentView addSubview:_infoLabel];
    _rightImgView=[[UIImageView alloc]initWithFrame:CGRectMake(self.width-10-10, 22, 10, 20)];
    _rightImgView.image=[UIImage imageNamed:@"右箭头2@"];
    _rightImgView.hidden=YES;
    [self.contentView addSubview:_rightImgView];
}

- (void)setModel:(MessageModel *)model{
    _model=model;
    _avartImgView.image=[UIImage imageNamed:@"通知2@"];
    _nickLabel.text=@"Leon";
    _messageLabel.text=@"asfjkhgffd";
    _timeLabel.text=@"10-10";
}


@end

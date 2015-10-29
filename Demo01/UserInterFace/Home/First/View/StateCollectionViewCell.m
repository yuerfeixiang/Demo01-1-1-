//
//  StateCollectionViewCell.m
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "StateCollectionViewCell.h"

#import "StateModel.h"
#import "UserModel.h"

#import "UIViewExt.h"

 
@implementation StateCollectionViewCell

- (void)awakeFromNib {
//    UIImage *tagImgName=[[UIImage imageNamed:@"芭蕾2@"] stretchableImageWithLeftCapWidth:20    topCapHeight:20];
    //用户头像
    _userImgView.layer.cornerRadius=_userImgView.height/2;
    _userImgView.clipsToBounds=YES;
    _updataTimeLabel.textColor=[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
    //Button
    [_zanButton setImage:[UIImage imageNamed:@"点赞2@_1"] forState:UIControlStateNormal];
    [_zanButton setImage:[UIImage imageNamed:@"点赞2@_2"] forState:UIControlStateSelected];
    [_zanButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 33)];
    [_zanButton setTitle:@"1111" forState:UIControlStateNormal];
    [_zanButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
    [_zanButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    
    [_messageButton setImage:[UIImage imageNamed:@"评论2@"] forState:UIControlStateNormal];
    [_messageButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 32)];
    [_messageButton setTitle:@"3K+" forState:UIControlStateNormal] ;
    [_messageButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
    [_messageButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [_shareButton setImage:[UIImage imageNamed:@"转发2@"] forState:UIControlStateNormal];
    [_shareButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 33)];
    [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [_shareButton setTitleColor:[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1] forState:UIControlStateNormal];
    [_shareButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}


- (void)setModel:(StateModel *)model{
    
    
}
- (IBAction)zanButtonAction:(UIButton *)sender {
    sender.selected=!sender.selected;
}
- (IBAction)shareButtonAction:(UIButton *)sender {
}
- (IBAction)messageButtonAction:(UIButton *)sender {
}
- (IBAction)rightButtonAction:(UIButton *)sender {
    sender.selected=!sender.selected;
}


@end

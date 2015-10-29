//
//  VideoCollectionCell.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "VideoCollectionCell.h"

#import "UIViewExt.h"

#import "DanceModel.h"

@implementation VideoCollectionCell

- (void)awakeFromNib {
    [self.playButton setImage:[UIImage imageNamed:@"播放2@"] forState:UIControlStateNormal];
    [self.playButton addTarget:self action:@selector(playButtonAction:) forControlEvents:UIControlEventTouchUpInside];
     self.playButton.center=_titleImgView.center;
    self.userImgView.layer.cornerRadius=self.userImgView.width/2;
   
    _decLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    
    [_likeButton setImage:[UIImage imageNamed:@"喜欢2@_1"] forState:UIControlStateNormal];
    [_likeButton setImage:[UIImage imageNamed:@"喜欢2@_2"] forState:UIControlStateSelected];
}

- (void)setModel:(DanceModel *)model{
    _model=model;
    self.titleImgView.image=[UIImage imageNamed:model.titleImgName];
    self.decLabel.text=@"adsfdgh";
}

- (IBAction)likeButtonAction:(UIButton *)sender {
    sender.selected=!sender.selected;
}


#pragma mark - playButton Action
- (void)playButtonAction:(UIButton *)sender{
    
}
@end

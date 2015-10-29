//
//  ClassCollectionCell.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "ClassCollectionCell.h"
#import "ClassModel.h"

@implementation ClassCollectionCell

- (void)awakeFromNib {
    
    
}

- (void)setModel:(ClassModel *)model{
    _model=model;
    _enNameLabel.text=model.enName;
    _cnNameLabel.text=model.cnName;
    _imgView.image=[UIImage imageNamed:model.imgName];
}

@end

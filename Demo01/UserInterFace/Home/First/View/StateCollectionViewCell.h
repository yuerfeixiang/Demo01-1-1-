//
//  StateCollectionViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AppearDelegate<NSObject>
- (void)appearView:(UIButton *)sender;
@end;

@class StateModel;
@interface StateCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet UILabel *userNickLabel;
@property (weak, nonatomic) IBOutlet UILabel *decLabel;
@property (weak, nonatomic) IBOutlet UIView *contenView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@property(nonatomic,strong)StateModel *model;
@property (weak, nonatomic) IBOutlet UIButton *messageButton;
@property (weak, nonatomic) IBOutlet UILabel *updataTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property(nonatomic,assign)id<AppearDelegate> delegate;

@end

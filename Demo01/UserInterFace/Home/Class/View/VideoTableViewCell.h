//
//  VideoTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playImgContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *mengImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImgView;
@property (weak, nonatomic) IBOutlet UIImageView *playImgView;

@end

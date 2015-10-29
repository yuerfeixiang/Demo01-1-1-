//
//  MaskTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/20.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *isMaskButton;
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UILabel *maskLabel;

@end

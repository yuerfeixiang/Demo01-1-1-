//
//  InformTableViewCell.h
//  Demo01
//
//  Created by Deo on 15/10/22.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *infoListLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *openSwitch;

@end

//
//  danceVeidoTableViewCell.m
//  Demo01
//
//  Created by zq on 15/10/27.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "danceVeidoTableViewCell.h"
#import "Common.h"
@implementation danceVeidoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.headImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.headImage];
        
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.textColor  = HEXCOLOR(0x656869);
        [self.nameLabel setFont:[UIFont systemFontOfSize:15]];
        [self.contentView addSubview:self.nameLabel];
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.textColor  = HEXCOLOR(0xbcbcbc);
        [self.timeLabel setFont:[UIFont systemFontOfSize:10]];
        [self.contentView addSubview:self.timeLabel];
        
        self.messageLabel = [[UILabel alloc]init];
        self.messageLabel.textColor  = HEXCOLOR(0x939393);
        [self.messageLabel setFont:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:self.messageLabel];
        
        self.supportImage = [[UIImageView alloc]init];
        [self.contentView addSubview:self.supportImage];
        
        self.supportLabel = [[UILabel alloc]init];
        self.supportLabel.textColor  = HEXCOLOR(0xbcbcbc);
        [self.supportLabel setFont:[UIFont systemFontOfSize:9]];
        [self.contentView addSubview:self.supportLabel];
        
        self.chooseView = [[UIScrollView alloc]init];
        [self.contentView addSubview:self.chooseView];
        
//        self.chooseTable = [[UITableView alloc]init];
//        [self.contentView addSubview:self.chooseTable];
    }
    
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

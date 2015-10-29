//
//  photoCollectionViewCell.m
//  Demo01
//
//  Created by zq on 15/10/29.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "photoCollectionViewCell.h"

@implementation photoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.photoView = [[UIImageView alloc]init];
        self.photoView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.photoView];
        
    }
    return self;
}
@end

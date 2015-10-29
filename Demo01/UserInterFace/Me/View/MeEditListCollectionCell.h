//
//  MeEditListCollectionCell.h
//  Demo01
//
//  Created by Deo on 15/10/16.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeEditListCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@end

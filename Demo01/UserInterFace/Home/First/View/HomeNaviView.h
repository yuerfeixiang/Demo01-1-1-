//
//  HomeNaviView.h
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangeViewDelegate<NSObject>
- (void)changeView:(int)index;
@end

@interface HomeNaviView : UIView

@property (weak, nonatomic) IBOutlet UIButton *classButton;
@property (weak, nonatomic) IBOutlet UIButton *danceButton;
@property (weak, nonatomic) IBOutlet UIButton *gzButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (retain, nonatomic)UIImageView *selectedImgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchRightConstrain;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerConstrain;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *classLeftConstrain;
@property(nonatomic,retain)id<ChangeViewDelegate> delegate;
@end

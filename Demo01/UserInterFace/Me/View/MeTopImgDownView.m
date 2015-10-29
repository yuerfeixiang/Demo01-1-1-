//
//  MeTopImgDownView.m
//  Demo01
//
//  Created by Deo on 15/10/19.
//  Copyright © 2015年 deo. All rights reserved.
//


#import "MeTopImgDownView.h"

#import "MeTopView.h"

#import "UIView+UIViewController.h"
#import "Common.h"
#import "UIViewExt.h"

#import "UserEditingViewController.h"

@implementation MeTopImgDownView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self _createSubView];
    }
    return self;
}

- (void)_createSubView{
    _topView=[[[NSBundle mainBundle] loadNibNamed:@"MeTopView" owner:self options:nil] lastObject];
    [self addSubview:_topView];
    // 移除多余的控件
    [_topView.userImgView removeFromSuperview];
    [_topView.avartImgView removeFromSuperview];
    [_topView.markLabel removeFromSuperview];
    [_topView.loadView removeFromSuperview];
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, _topView.bottom, kScreenWidth, 63)];
    bgView.backgroundColor=[UIColor whiteColor];
    [_topView addSubview:bgView];
    //用户头像
    UIImageView *downImgView=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-74)/2, _topView.bottom-37, 74, 74)];
    downImgView.image=[UIImage imageNamed:@"下面头像外边2@"];
    [_topView addSubview:downImgView];
    
    UIImageView *userImgView=[[UIImageView alloc]initWithFrame:CGRectMake(downImgView.left+2, downImgView.top+2, 70, 70)];
    userImgView.image=[UIImage imageNamed:@"头像2@"];
    userImgView.layer.cornerRadius=userImgView.height/2;
    userImgView.clipsToBounds=YES;
    [_topView addSubview:userImgView];
    
    UILabel *maskLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, userImgView.bottom+10, kScreenWidth, 16)];
    maskLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    maskLabel.font=[UIFont systemFontOfSize:13];
    maskLabel.textAlignment=NSTextAlignmentCenter;
    maskLabel.text=@"I'm into anything artistic. I still watch dispay Channel.";
    [_topView addSubview:maskLabel];
    
}



@end

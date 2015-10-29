//
//  HeadView.m
//  Demo01
//
//  Created by Deo on 15/10/14.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "HeadView.h"

#import "Common.h"
#import "UIViewExt.h"

#import "BannerView.h"

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        //[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];

        [self _createSubView];
    }
    return self;
}

- (void)_createSubView{
     BannerView *bannerView=[[BannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 188)];
    bannerView.bannerImgArr=@[@"nearbanner2@_1",
                               @"nearbanner2@_2",
                               @"nearbanner2@_3",
                               @"nearbanner2@_4",
                               @"nearbanner2@_5"];
    [self addSubview:bannerView];
    
    //Button
    UIButton *activityButton=[UIButton buttonWithType:UIButtonTypeCustom];
    activityButton.frame=CGRectMake(kScreenWidth*105/750, bannerView.height+10, 100, 20);
    UIImageView *leftImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 1, 20, 18)];
    leftImgView.image=[UIImage imageNamed:@"活动赛事2@"];
    [activityButton addSubview:leftImgView];
    
    UILabel *leftLabel=[[UILabel alloc]initWithFrame:CGRectMake(33, 0, 67, 20)];
    leftLabel.text=@"活动赛事";
    leftLabel.font=[UIFont systemFontOfSize:15];
    leftLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    [activityButton addSubview:leftLabel];
    [self addSubview:activityButton];
    
    UIButton *hotButton=[UIButton buttonWithType:UIButtonTypeCustom];
    hotButton.frame=CGRectMake(kScreenWidth-kScreenWidth*105/750-100,bannerView.height+10, 100, 20);
    UIImageView *rightImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 1, 20, 18)];
    rightImgView.image=[UIImage imageNamed:@"热门群组2@"];
    [hotButton addSubview:rightImgView];
    
    UILabel *rightLabel=[[UILabel alloc]initWithFrame:CGRectMake(33, 0, 67, 20)];
    rightLabel.text=@"热门群组";
    rightLabel.font=[UIFont systemFontOfSize:15];
    rightLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    [hotButton addSubview:rightLabel];
    [self addSubview:hotButton];
    
    //
    UIView *centerView=[[UIView alloc]initWithFrame:CGRectMake(kScreenWidth/2, bannerView.height+10, 1, 20)];
    centerView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [self addSubview:centerView];
    
    //
    UIView *colorView=[[UIView alloc]initWithFrame:CGRectMake(0, bannerView.height+40, kScreenWidth, 5)];
    colorView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    [self addSubview:colorView];
    
    //筛选按钮
    UIButton *choiceButton =[UIButton buttonWithType:UIButtonTypeCustom];
    choiceButton.frame=CGRectMake(kScreenWidth-20-31, colorView.bottom+8, 31, 16);
    [choiceButton setTitle:@"筛选" forState:UIControlStateNormal];
    choiceButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [choiceButton setTitleColor:[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1] forState:UIControlStateNormal];
    [choiceButton addTarget:self action:@selector(choiceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:choiceButton];
    
    UILabel *nearLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, colorView.bottom+24, 45, 16)];
    nearLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    nearLabel.text=@"附近的人";
    nearLabel.font=[UIFont systemFontOfSize:11];
    [self addSubview:nearLabel];
    UIView *vlineView=[[UIView alloc]initWithFrame:CGRectMake(18+45, colorView.bottom+30, kScreenWidth-64, 1)];
    vlineView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [self addSubview:vlineView];
}


#pragma mark - ChoiceButton Action
- (void)choiceButtonAction:(UIButton *)sender{
    
}
@end

//
//  OtherInCenterViewController.m
//  Demo01
//
//  Created by Deo on 15/10/21.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "OtherInCenterViewController.h"

#import "MeTopView.h"
#import "MeTopImgDownView.h"
#import "PageChoiceView.h"

#import "MyStateTableView.h"
#import "TagTableView.h"
#import "MaskTableView.h"
#import "FanTableView.h"
#import "UserInfoViewController.h"

#import "Common.h"
#import "UIViewExt.h"

@interface OtherInCenterViewController ()<ChangePageDelegate>{
    MeTopImgDownView *_topView;
    MyStateTableView *_stateTableView;
    TagTableView *_tagTableView;
    MaskTableView *_maskTableView;
    FanTableView *_fanTableView;
    PageChoiceView *_pageChoiceView;
    
    UIView *_whiteView;
}

@end

@implementation OtherInCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    [self _createTopView];
    [self _createTableView];

    [self _createWhiteView];
}

- (void)_createTopView{
    _topView=[[MeTopImgDownView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 270+30+30+40+40)];
    [_topView.topView.rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_topView.topView.backButton addTarget:self
                                    action:@selector(backButtonAction:)
                          forControlEvents:UIControlEventTouchUpInside];
    [_topView.topView.editButton setImage:[UIImage imageNamed:@"资料2@"]
                                 forState:UIControlStateNormal];
    [_topView.topView.editButton addTarget:self
                                    action:@selector(editButtonAction:)
                          forControlEvents:UIControlEventTouchUpInside];
    _topView.backgroundColor=[UIColor clearColor];
    
    //添加关注、聊天按钮
    UIView *buttonView=[[UIView alloc]initWithFrame:CGRectMake(0, _topView.bottom-80, kScreenWidth, 40)];
    buttonView.backgroundColor=[UIColor whiteColor];
    [_topView addSubview:buttonView];
    //关注按钮
    UIButton *gzButton=[[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth-225)/2, 13, 100, 27)];
    [gzButton setImage:[UIImage imageNamed:@"加关注白2@"] forState:UIControlStateNormal];
    [gzButton setImage:[UIImage imageNamed:@"已关注2白@"] forState:UIControlStateSelected];
    [gzButton addTarget:self action:@selector(gzButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonView addSubview:gzButton];
    
     //聊天按钮;
    UIButton *talkButton=[[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth-225)/2+125, 13, 100, 27)];
    [talkButton setImage:[UIImage imageNamed:@"聊天白2@"] forState:UIControlStateNormal];
    [talkButton addTarget:self action:@selector(talkButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    [buttonView addSubview:talkButton];
    
    //添加选择选项子视图
    _pageChoiceView=[[PageChoiceView alloc]initWithFrame:CGRectMake(0, _topView.bottom-40, kScreenWidth, 40)];
    _pageChoiceView.delegate=self;
    _pageChoiceView.backgroundColor=[UIColor whiteColor];
    [_topView addSubview:_pageChoiceView];
    
    UIView *bView=[[UIView alloc]initWithFrame:CGRectMake(0, _pageChoiceView.bottom, kScreenWidth, 5)];
    bView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    [_topView addSubview:bView];
    
}

- (void)_createTableView{
    
    //动态
    _stateTableView=[[MyStateTableView alloc]initWithFrame:self.view.bounds];
    [self _createTopView];
    _pageChoiceView.selectedIndex=2000;
    _stateTableView.tableHeaderView=_topView;
    _stateTableView.hidden=NO;
    [self.view addSubview:_stateTableView];
    
    //标签
    _tagTableView=[[TagTableView alloc]initWithFrame:self.view.bounds];
    _tagTableView.hidden=YES;
    [self.view addSubview:_tagTableView];
    
    //关注
    _maskTableView=[[MaskTableView alloc]initWithFrame:self.view.bounds];
    _maskTableView.hidden=YES;
    [self.view addSubview:_maskTableView];
    //粉丝
    _fanTableView=[[FanTableView alloc]initWithFrame:self.view.bounds];
    _fanTableView.hidden=YES;
    [self.view addSubview:_fanTableView];

}

//创建黑名单 举报 视图
- (void)_createWhiteView{
    _whiteView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _whiteView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"拉入黑名单蒙版2@"]];
    _whiteView.alpha=1;
    [self.view insertSubview:_whiteView atIndex:self.view.subviews.count];
    
    NSArray *nameArr=@[@"拉入黑名单",@"举报",@"取消"];
    for (int i=0; i<3; i++) {
        UIView *alerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 54)];
        alerView.backgroundColor=[UIColor whiteColor];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor=[UIColor whiteColor];
        button.frame=CGRectMake((kScreenWidth-100)/2, (alerView.height-16)/2, 100, 16);
        button.titleLabel.textAlignment=NSTextAlignmentCenter;
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1]
                     forState:UIControlStateNormal];
        [button setTitle:nameArr[i] forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(buttonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        [alerView addSubview:button];
        [_whiteView addSubview:alerView];
        
        if (i==0) {
            alerView.frame=CGRectMake(0, kScreenHeight-54*3-1-11,kScreenWidth,55);
        }else if (i==1){
            alerView.origin=CGPointMake(0, kScreenHeight-54*2-11);
        }else{
            alerView.origin=CGPointMake(0, kScreenHeight-54);
            [button setTitleColor:[UIColor colorWithRed:27/255.0 green:178/255.0 blue:233/255.0 alpha:1]
                         forState:UIControlStateNormal];

        }
    }
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-54*2-11, kScreenWidth, 1)];
    lineView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [_whiteView addSubview:lineView];
    _whiteView.hidden=YES;
    
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightButtonAction:(UIButton *)sender{
    _whiteView.hidden=NO;
}

- (void)editButtonAction:(UIButton *)sender{

    UserInfoViewController *infoVC=[[UserInfoViewController alloc]init];
    [self presentViewController:infoVC animated:YES completion:nil];
}
//聊天按钮事件
- (void)talkButtonAction:(UIButton *)sender{
    
}

//关注按钮事件
- (void)gzButtonAction:(UIButton *)sender{
    sender.selected=!sender.selected;
}

//举报、取消按钮事件
- (void)buttonAction:(UIButton*)sender{
    _whiteView.hidden=YES;
}

#pragma mark - ChangePageDelegate
- (void)changePageWithIndex:(int)index{
    
    if (index==0) {
        [self _createTopView];
        _pageChoiceView.selectedIndex=2000;
        //个人中心动态
        _stateTableView.tableHeaderView=_topView;
        _stateTableView.hidden=NO;
        _maskTableView.hidden=YES;
        _tagTableView.hidden=YES;
        _fanTableView.hidden=YES;
        
    }else if (index==1){
        [self _createTopView];
        _pageChoiceView.selectedIndex=2001;
        //个人中心标签
        _stateTableView.hidden=YES;
        _tagTableView.tableHeaderView=_topView;
        _tagTableView.hidden=NO;
        _maskTableView.hidden=YES;
        _fanTableView.hidden=YES;
        
    }else if (index==2){
        [self _createTopView];
        _pageChoiceView.selectedIndex=2002;
        //个人中心关注
        _maskTableView.tableHeaderView=_topView;
        _stateTableView.hidden=YES;
        _tagTableView.hidden=YES;
        _maskTableView.hidden=NO;
        _fanTableView.hidden=YES;
        
    }else{
        [self _createTopView];
        _pageChoiceView.selectedIndex=2003;
        _fanTableView.tableHeaderView=_topView;
        //个人中心粉丝
        _stateTableView.hidden=YES;
        _maskTableView.hidden=YES;
        _tagTableView.hidden=YES;
        _fanTableView.hidden=NO;
    }
}


@end

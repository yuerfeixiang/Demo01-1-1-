//
//  PersonInCenterViewController.m
//  Demo01
//
//  Created by Deo on 15/10/19.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "PersonInCenterViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "MeTopView.h"
#import "MeTopImgDownView.h"
#import "PageChoiceView.h"
#import "MyStateTableView.h"
#import "TagTableView.h"
#import "MaskTableView.h"
#import "FanTableView.h"

#import "UserEditingViewController.h"

@interface PersonInCenterViewController ()<ChangePageDelegate>{
    MeTopImgDownView *_topView;
    MyStateTableView *_stateTableView;
    TagTableView *_tagTableView;
    MaskTableView *_maskTableView;
    FanTableView *_fanTableView;
    PageChoiceView *_pageChoiceView;
}

@end

@implementation PersonInCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
   // [self _createTopView];
    [self _createTableView];
    
}

- (void)_createTopView{
      _topView=[[MeTopImgDownView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 270+30+30+40)];
     [_topView.topView.rightButton removeFromSuperview];
     [_topView.topView.backButton addTarget:self
                                     action:@selector(backButtonAction:)
                           forControlEvents:UIControlEventTouchUpInside];
     [_topView.topView.editButton setImage:[UIImage imageNamed:@"编辑2@"]
                                  forState:UIControlStateNormal];
     [_topView.topView.editButton addTarget:self
                                     action:@selector(editButtonAction:)
                           forControlEvents:UIControlEventTouchUpInside];
        _topView.backgroundColor=[UIColor clearColor];
        //添加选择选项子视图
      _pageChoiceView=[[PageChoiceView alloc] initWithFrame:CGRectMake(0, _topView.bottom-40, kScreenWidth, 40)];
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
//    [self _createTopView];
//    _pageChoiceView.selectedIndex=2001;
//    _tagTableView.tableHeaderView=_topView;
    _tagTableView.hidden=YES;
    [self.view addSubview:_tagTableView];
    
    //关注
    _maskTableView=[[MaskTableView alloc]initWithFrame:self.view.bounds];
//    [self _createTopView];
//    _pageChoiceView.selectedIndex=2002;
//    _maskTableView.tableHeaderView=_topView;
    _maskTableView.hidden=YES;
    [self.view addSubview:_maskTableView];
    //粉丝
    _fanTableView=[[FanTableView alloc]initWithFrame:self.view.bounds];
//    [self _createTopView];
//    _pageChoiceView.selectedIndex=2003;
//    _fanTableView.tableHeaderView=_topView;
    _fanTableView.hidden=YES;
    [self.view addSubview:_fanTableView];
    
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)editButtonAction:(UIButton *)sender{
    UserEditingViewController *userEditVC=[[UserEditingViewController alloc]init];
    [self presentViewController:userEditVC animated:YES completion:nil];
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

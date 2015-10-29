//
//  LastestViewController.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "LastestViewController.h"

#import "Common.h"
#import "NewTopView.h"
#import "ClassNaviView.h"

#import "VideoTableView.h"

@interface LastestViewController ()<UIScrollViewDelegate>{
    
    VideoTableView *_tableView;
    
    ClassNaviView *_naviView;
}

@end

@implementation LastestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    _tableView=[[VideoTableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];

    [self _createHeadView];
    [self _createNaviView];
}

- (void)_createNaviView{
    _naviView=[[ClassNaviView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kNavigationBarHeight)];
    _naviView.backgroundColor=[UIColor clearColor];
    [self.view insertSubview:_naviView atIndex:self.view.subviews.count];

    [_naviView.backButton addTarget:self
                   action:@selector(backButtonAction:)
         forControlEvents:(UIControlEventTouchUpInside)];
    _naviView.titleLabel.text=@"最新";
}

- (void)_createHeadView{
    NewTopView *headView=[[[NSBundle mainBundle]loadNibNamed:@"NewTopView" owner:self options:nil] lastObject];
    headView.postImgView.image=[UIImage imageNamed:@"new图2@_1"];
    headView.frame=CGRectMake(0, 0, kScreenWidth, 215);
    _tableView.tableHeaderView=headView;
}

#pragma mark - TableView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetY=scrollView.contentOffset.y;
    if (offSetY<44) {
        _naviView.backgroundColor=[UIColor clearColor];
        [_naviView.backButton setImage:[UIImage imageNamed:@"返回2@_1"] forState:UIControlStateNormal];
        _naviView.titleLabel.textColor=[UIColor whiteColor];
    }else{
        _naviView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"顶部栏2@"]];
        [_naviView.backButton setImage:[UIImage imageNamed:@"返回2@_2"] forState:UIControlStateNormal];
        _naviView.titleLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    }
}

#pragma mark - backButton Action{
- (void)backButtonAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

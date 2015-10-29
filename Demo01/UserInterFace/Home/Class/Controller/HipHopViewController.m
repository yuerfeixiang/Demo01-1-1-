//
//  HipHopViewController.m
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "HipHopViewController.h"

#import "Common.h"
#import "ClassNaviView.h"
#import "HipTableHeadView.h"

#import "VideoTableViewCell.h"
#define kVideoTableViewCellIdentifier @"k_Video_TableView_Cell_Identifier"

@interface HipHopViewController ()<UITableViewDataSource,UITableViewDelegate>{
    ClassNaviView *_naviView;
    
    HipTableHeadView *_tableHeadView;
    
    UITableView *_tableView;
}

@end

@implementation HipHopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createTableView];
    [self _createNaviView];
}

- (void)_createTableView{
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.tableHeaderView=_tableHeadView;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:kVideoTableViewCellIdentifier];
    
    //TableView HeadView
    _tableHeadView=[[HipTableHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 215+64+315+44)];
    _tableHeadView.backgroundColor=[UIColor whiteColor];
    _tableView.tableHeaderView=_tableHeadView;

}

- (void)_createNaviView{
    _naviView=[[ClassNaviView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kNavigationBarHeight)];
    _naviView.backgroundColor=[UIColor clearColor];
    [self.view insertSubview:_naviView atIndex:self.view.subviews.count];
    
    [_naviView.backButton addTarget:self
                             action:@selector(backButtonAction:)
                   forControlEvents:(UIControlEventTouchUpInside)];
    _naviView.titleLabel.text=self.titleName;
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kVideoTableViewCellIdentifier forIndexPath:indexPath];
    cell.postImgView.image=[UIImage imageNamed:[NSString stringWithFormat:@"视频2@_%1ld",(long)indexPath.row+1]];

    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 159;
}

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

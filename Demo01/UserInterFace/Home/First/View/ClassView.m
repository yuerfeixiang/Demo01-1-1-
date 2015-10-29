//
//  ClassView.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "BannerView.h"

#import "HomeNaviView.h"
#import "ClassCollectionView.h"
#import "MJRefresh.h"
#import "Common.h"

#import "ClassView.h"
#import "UIViewExt.h"

@implementation ClassView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews{
    
    _bannerView=[[BannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 190)];
    _bannerView.bannerImgArr=@[@"banner图2@_1",@"banner图2@_2",@"banner图2@_3",@"banner图2@_4",@"banner图2@_5"];
    _classTableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:_classTableView];
    _classTableView.tableHeaderView=_bannerView;
    _classTableView.delegate=self;
    _classTableView.dataSource=self;

    //下拉刷新
    _classTableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestData];
    }];

    //上拉刷新
    _classTableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestMoreData];
    }];

//    [self createLeaderView];
}

- (void)requestData{
    [_classTableView reloadData];
    [_classTableView.header endRefreshing];
}
- (void)requestMoreData{
    [_classTableView reloadData];
    [_classTableView.footer endRefreshing];
}

- (void)createLeaderView{
    
    HomeNaviView *naviView=[[[NSBundle mainBundle]loadNibNamed:@"HomeNaviView" owner:self options:nil] lastObject];
    naviView.classButton.selected=YES;
    naviView.danceButton.selected=NO;
    naviView.gzButton.selected=NO;
    naviView.selectedImgView.center=naviView.classButton.center;
    [self addSubview:naviView];
    
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-4, kScreenHeight-kTabBarHeight-_bannerView.height)];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=2;
    layout.minimumLineSpacing=2;
    layout.itemSize=CGSizeMake((kScreenWidth-6)/2, 84);
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    CGRect frame=CGRectMake(2,2, kScreenWidth-4, kScreenHeight-_bannerView.height-kTabBarHeight-6);
    
    ClassCollectionView *classCell=[[ClassCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    [cell.contentView addSubview:classCell];
    return cell;
}
#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenHeight-_bannerView.height-kTabBarHeight-6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end

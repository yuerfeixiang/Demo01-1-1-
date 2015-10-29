//
//  DanceView.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "DanceView.h"

#import "Common.h"
#import "MJRefresh.h"
#import "UIViewExt.h"

#import "DanceCollectionView.h"
#import "DanceModel.h"
#import "BannerView.h"
#import "HomeNaviView.h"
#import "BlackView.h"
#import "UIView+UIViewController.h"
#import "userDanceViewController.h"
@implementation DanceView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
        [self _createSubViews];
        [self createblackView];
        self.data=[NSMutableArray array];
        [self requestData];
    }
    return self;
}

- (void)_createSubViews{
    
    _bannerView=[[BannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 190)];
    _bannerView.bannerImgArr=@[@"hotbanner2@_1",@"hotbanner2@_2",@"hotbanner2@_3",@"hotbanner2@_4",@"hotbanner2@_5"];
    _danceTableView=[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:_danceTableView];
    _danceTableView.backgroundColor=[UIColor clearColor];
    _danceTableView.tableHeaderView=_bannerView;
    _danceTableView.delegate=self;
    _danceTableView.dataSource=self;
    _danceTableView.separatorColor=[UIColor whiteColor];
    
    //下拉刷新
    _danceTableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestData];
    }];
    
    //上拉刷新
    _danceTableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestMoreData];
    }];
    
    [self createLeaderView];
}

- (void)requestData{
    
    NSArray *imgArr=@[@"左图2@_1",@"右图2@_1",@"左图2@_2",@"右图2@_2",@"左图2@_3",@"右图2@_3"];
    for (NSString *imgName in imgArr) {
        DanceModel *model=[[DanceModel alloc]init];
        model.titleImgName=imgName;
        [self.data addObject:model];
    }
    [_danceTableView reloadData];
    [_danceTableView.header endRefreshing];
}
- (void)requestMoreData{
    [_danceTableView reloadData];
    [_danceTableView.footer endRefreshing];
}

- (void)createLeaderView{
    
    HomeNaviView *naviView=[[[NSBundle mainBundle]loadNibNamed:@"HomeNaviView" owner:self options:nil] lastObject];
    naviView.classButton.selected=NO;
    naviView.danceButton.selected=YES;
    naviView.gzButton.selected=NO;
    naviView.selectedImgView.center=naviView.danceButton.center;
    [self addSubview:naviView];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        UITableViewCell *cell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-4, 31)];
        cell.backgroundColor=[UIColor clearColor];
        UIImageView *enTitleView=[[UIImageView alloc]initWithFrame:CGRectMake(21, 10, 20, 10)];
        enTitleView.image=[UIImage imageNamed:@"hot2@_1"];
        [cell.contentView addSubview:enTitleView];
        
        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(enTitleView.right+9, 5, 40, 20)];
        titleLabel.text=@"热门";
        titleLabel.font=[UIFont systemFontOfSize:17];
        titleLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
        [cell.contentView addSubview:titleLabel];
        
        UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame=CGRectMake(kScreenWidth-30-12, 10, 12, 8);
        [rightButton setImage:[UIImage imageNamed:@"下拉箭头2@"] forState:UIControlStateNormal];
        [rightButton setImage:[UIImage imageNamed:@"向上箭头2@"] forState:UIControlStateSelected];
        [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:rightButton];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        return cell;
    }else{
    
        UITableViewCell *cell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-4, kScreenHeight-kTabBarHeight-_bannerView.height-31)];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;

        cell.backgroundColor=[UIColor clearColor];
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing=3;
        layout.minimumLineSpacing=3;
        layout.itemSize=CGSizeMake((kScreenWidth-7)/2, 133);
        layout.scrollDirection=UICollectionViewScrollDirectionVertical;
        CGRect frame=CGRectMake(2,2, kScreenWidth-4, kScreenHeight-_bannerView.height-kTabBarHeight);
    
        DanceCollectionView *classCell=[[DanceCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
        classCell.backgroundColor=[UIColor clearColor];
        classCell.data=self.data;
        [cell.contentView addSubview:classCell];
        return cell;
    }
}
#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 31;
    }else{
        return kScreenHeight-_bannerView.height-kTabBarHeight-6;
    }
}

#pragma mark - Button Action
- (void)rightButtonAction:(UIButton *)sender{
    sender.selected=!sender.selected;
    if (sender.selected==YES) {
        [UIView animateWithDuration:0.35 animations:^{
            _blackView.alpha=1;
            _blackImgView.alpha=1;
            _blackView.frame=CGRectMake(0, _bannerView.height+29, kScreenWidth, 196);

        }];
    }else if(sender.selected==NO){
        [UIView animateWithDuration:0.35 animations:^{
            _blackView.alpha=0;
            _blackImgView.alpha=0;
            _blackView.frame=CGRectMake(0, _bannerView.height+29, kScreenWidth, 0);
            
        }];
    }
}

- (void)createblackView{
    _blackView=[[BlackView alloc]initWithFrame:CGRectMake(0, _bannerView.height+29, kScreenWidth, 196)];
    _blackView.alpha=0;
    [self addSubview:_blackView];
    
    _blackImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, _blackView.origin.y+_blackView.height, kScreenWidth, kScreenHeight-kTabBarHeight- _blackView.origin.y-_blackView.height)];
    _blackImgView.image=[UIImage imageNamed:@"弹窗蒙版2@"];
    _blackImgView.alpha=0;
    [self addSubview:_blackImgView];
}
@end

//
//  ProisView.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "ProisView.h"

#import "Common.h"
#import "MJRefresh.h"
#import "HomeNaviView.h"
#import "UIViewExt.h"

#import "StateCollectionView.h"
@implementation ProisView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
        self.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
        
        [self _createWhiteView];
    }
    return self;
}

- (void)_createSubViews{
    
    _stateTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-kTabBarHeight) style:UITableViewStylePlain];
    _stateTableView.backgroundColor=[UIColor clearColor];
    [self addSubview:_stateTableView];
    _stateTableView.delegate=self;
    _stateTableView.dataSource=self;
    
    //下拉刷新
    _stateTableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestData];
    }];
    
    //上拉刷新
    _stateTableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestMoreData];
    }];
    
    [self createLeaderView];
}

- (void)requestData{
    [_stateTableView reloadData];
    [_stateTableView.header endRefreshing];
}
- (void)requestMoreData{
    [_stateTableView reloadData];
    [_stateTableView.footer endRefreshing];
}

//创建收藏 举报 视图
- (void)_createWhiteView{
    _whiteView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-kTabBarHeight-64)];
    _whiteView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"图片上的黑色蒙版2@"]];
    _whiteView.alpha=1;
    [self insertSubview:_whiteView atIndex:self.subviews.count];
    NSArray *nameArr=@[@"收藏",@"举报",@"取消"];
    for (int i=0; i<3; i++) {
        UIView *alerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 54)];
        alerView.backgroundColor=[UIColor whiteColor];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor=[UIColor whiteColor];
        button.frame=CGRectMake((kScreenWidth-60)/2, (alerView.height-16)/2, 60, 16);
        button.titleLabel.textAlignment=NSTextAlignmentCenter;
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitle:nameArr[i] forState:UIControlStateNormal];
        [alerView addSubview:button];
        [_whiteView addSubview:alerView];
        
        if (i==0) {
            alerView.frame=CGRectMake(0, kScreenHeight-kTabBarHeight-64-54*3-1-11,kScreenWidth,55);
        }else if (i==1){
            alerView.origin=CGPointMake(0, kScreenHeight-kTabBarHeight-64-54*2-11);
        }else{
            alerView.origin=CGPointMake(0, kScreenHeight-kTabBarHeight-64-54);
            [button setTitleColor:[UIColor colorWithRed:27/255.0 green:178/255.0 blue:233/255.0 alpha:1]
                         forState:UIControlStateNormal];

        }
    }
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-kTabBarHeight-64-54*2-11, kScreenWidth, 1)];
    lineView.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [_whiteView addSubview:lineView];
    _whiteView.hidden=YES;
    
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
        UITableViewCell *cell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        cell.backgroundColor=[UIColor clearColor];
        UIImageView *messView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 109, 30)];
        UIImage *image=[[UIImage imageNamed:@"2条消息2@"] stretchableImageWithLeftCapWidth:50 topCapHeight:15];
        messView.image=image;
        messView.layer.cornerRadius=15;
        messView.center=cell.contentView.center;
        messView.userInteractionEnabled=YES;
        [cell.contentView addSubview:messView];
//
//        UIImageView *imView=[[UIImageView alloc]initWithFrame:CGRectMake(165, 11, 20, 20)];
//        imView.image=[UIImage imageNamed:@""];
//        [cell.contentView addSubview:imView];
//        UILabel *messLabel=[[UILabel alloc]initWithFrame:CGRectMake(190, 11, 70, 20)];
//        messLabel.textColor=[UIColor blackColor];
//        messLabel.font=[UIFont systemFontOfSize:11];
//        [cell.contentView addSubview:messLabel];
//        
        UIButton *newsButton=[UIButton buttonWithType:UIButtonTypeCustom];
        newsButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
         newsButton.frame=CGRectMake(153, 6, 109, 30);
        newsButton.layer.cornerRadius=newsButton.height/2;
        [newsButton setImageEdgeInsets:UIEdgeInsetsMake(5, 15, 5, 65)];
        [newsButton setImage:[UIImage imageNamed:@"通知2@"] forState:UIControlStateNormal];
        [newsButton setTitle:@"2条新消息" forState:UIControlStateNormal];
        [newsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        newsButton.titleLabel.font=[UIFont systemFontOfSize:11];
        [newsButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 23, 5, 15)];
        newsButton.center=messView.center;
        [cell.contentView addSubview:newsButton];

        return cell;
    }else{
        UITableViewCell *cell=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-4, kScreenHeight-kTabBarHeight-64)];
        cell.backgroundColor=[UIColor clearColor];
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing=12;
        layout.minimumLineSpacing=12;
        layout.itemSize=CGSizeMake(kScreenWidth, 310);
        layout.scrollDirection=UICollectionViewScrollDirectionVertical;
        CGRect frame=CGRectMake(0,0, kScreenWidth, kScreenHeight-kTabBarHeight);
        
        StateCollectionView *stateCell=[[StateCollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
        [cell.contentView addSubview:stateCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
       return cell;
    }
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        return 44;
    }else{
        return kScreenHeight-kTabBarHeight-64;
    }
}

@end

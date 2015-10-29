//
//  SearchClassViewController.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "SearchClassViewController.h"
#import "VideoTableView.h"
#import "Common.h"

@interface SearchClassViewController ()<UISearchBarDelegate>{
    UISearchBar *_searchBar;
    VideoTableView *_tableView;
}

@end

@implementation SearchClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"课堂搜索背景图2@"]];
    
    [self _createNaviView];
    [self _createTableView];
    
}

- (void)_createNaviView{
    //导航视图
    UIView *_naviView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
    _naviView.backgroundColor=[UIColor colorWithRed:28/255.0
                                              green:28/255.0 blue:28/255.0
                                              alpha:0.8];
    [self.view addSubview:_naviView];
    
    //搜索框
    _searchBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"backg2@"]];
    [_searchBar.layer setMasksToBounds:YES];
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth-22-40 , 44)];
    //_searchBar.backgroundColor=[UIColor clearColor];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"搜感兴趣的舞蹈教学视频";
    _searchBar.tintColor = HEXCOLOR(0x2d99fe);
    //[_searchBar setBarTintColor:[UIColor clearColor]];
    _searchBar.barStyle = UIBarStyleBlack;
    [_naviView addSubview:_searchBar];
    
    //取消按钮
    UIButton *cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame=CGRectMake(kScreenWidth-62, 32, 40, 20);
    cancelButton.titleLabel.font=TEXT_FONT(17);
    [cancelButton setTitleColor:HEXCOLOR(0x2d99fe) forState:UIControlStateNormal];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self
                     action:@selector(cancelButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    [_naviView addSubview:cancelButton];

}

- (void)_createTableView{
    _tableView=[[VideoTableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight-kNavigationBarHeight)];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
    //头视图
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 22)];
    headView.backgroundColor=HEXCOLOR(0x1c1c1c);
    UILabel *resultLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 22)];
    resultLabel.text=@"搜索结果";
    resultLabel.textColor=HEXCOLOR(0x939393);
    resultLabel.font=TEXT_FONT(13);
    [headView addSubview:resultLabel];
    _tableView.tableHeaderView=headView;
    
    //尾视图
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 56)];
    footView.backgroundColor=HEXCOLOR(0x1c1c1c);
    UILabel *nomoreLabel=[[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-100)/2, 20, 100, 16)];
    nomoreLabel.text=@"暂无更多";
    nomoreLabel.textAlignment=NSTextAlignmentCenter;
    nomoreLabel.textColor=HEXCOLOR(0x939393);
    nomoreLabel.font=TEXT_FONT(13);
    [footView addSubview:nomoreLabel];
    _tableView.tableFooterView=footView;
}

#pragma mark - Button Action{
- (void)cancelButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

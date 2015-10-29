//
//  DiscoverViewController.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "DiscoverViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "ClassNaviView.h"
#import "HeadView.h"
#import "DiscoverTableViewCell.h"
#import "OtherInCenterViewController.h"

#define kDiscoverTableViewCellIdentifier @"kDiscoverTableViewCellIdentifier"
@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    HeadView *_headView;
    UITableView *_discoverTableView;
    ClassNaviView *_naviView;
}
@property(nonatomic,strong)NSMutableArray *data;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [self _createViews];
    [self _createNavView];
}

- (void)_createViews{
    _headView=[[HeadView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 188+40+8+5+29)];
    
    _discoverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight) style:UITableViewStylePlain];
    
    _discoverTableView.delegate=self;
    _discoverTableView.dataSource=self;
    _discoverTableView.separatorColor=[UIColor clearColor];
    [_discoverTableView registerNib:[UINib nibWithNibName:@"DiscoverTableViewCell" bundle:nil] forCellReuseIdentifier:kDiscoverTableViewCellIdentifier];
   
    _discoverTableView.tableHeaderView=_headView;
    [self.view addSubview:_discoverTableView];
    
}

- (void)_createNavView{
    _naviView=[[ClassNaviView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kNavigationBarHeight)];
    _naviView.backgroundColor=[UIColor clearColor];
    [self.view insertSubview:_naviView atIndex:self.view.subviews.count];
    
    [_naviView.backButton removeFromSuperview];
    _naviView.titleLabel.text=@"发现";
}

#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kDiscoverTableViewCellIdentifier forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.model=self.data[indexPath.row];
    
    return cell;
}

#pragma mark - tableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OtherInCenterViewController *otherInVC=[[OtherInCenterViewController alloc]init];
    [self presentViewController:otherInVC animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetY=scrollView.contentOffset.y;
    if (offSetY<44) {
        _naviView.backgroundColor=[UIColor clearColor];
//        _naviView.titleLabel.textColor=[UIColor whiteColor];
    }else{
        _naviView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"底部背景2@"]];
    }
}


@end

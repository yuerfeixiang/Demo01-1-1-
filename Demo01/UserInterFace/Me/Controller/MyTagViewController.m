//
//  MyTagViewController.m
//  Demo01
//
//  Created by Deo on 15/10/21.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MyTagViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "TagTableView.h"

@interface MyTagViewController (){
    TagTableView *_tableView;
}

@end

@implementation MyTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];

    [self _createSubView];
}

- (void)_createSubView{
    UIView *naviView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    naviView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:naviView];
    
    //返回按钮
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(10, 33, 10, 18);
    [backButton setImage:[UIImage imageNamed:@"灰返回2@"]
                forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(backButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:backButton];
    
    //标题
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 33, kScreenWidth-100, 18)];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    titleLabel.font=[UIFont systemFontOfSize:17];
    titleLabel.text=self.title;
    [naviView addSubview:titleLabel];
    
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
    headView.backgroundColor=[UIColor clearColor];
    //表视图
    _tableView=[[TagTableView alloc]initWithFrame:CGRectMake(0, naviView.bottom, kScreenWidth, kScreenHeight-naviView.height)];
    _tableView.tableHeaderView=headView;
    
    [self.view addSubview:_tableView];
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

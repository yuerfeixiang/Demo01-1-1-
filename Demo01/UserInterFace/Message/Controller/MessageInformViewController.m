//
//  MessageInformViewController.m
//  Demo01
//
//  Created by Deo on 15/10/27.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MessageInformViewController.h"

#import "Common.h"
#import "MessageInformTableViewCell.h"

#define kMessageInformTableViewCellIdentifier @"kMessage_Inform_TableViewCell_Id"
@interface MessageInformViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@end

@implementation MessageInformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HEXCOLOR(0xf8f8f8);
    [self _createNaviView];
    [self _CreateSubView];
}

- (void)_createNaviView{
    
    //标题
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    titleLabel.textColor=HEXCOLOR(0x656869);
    titleLabel.text=@"账号与安全";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=titleLabel;
    
    //返回按钮
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(0, 0, 9, 15);
    [backButton setImage:[UIImage imageNamed:@"灰返回2@"] forState:UIControlStateNormal];
    
    [backButton addTarget:self
                   action:@selector(backButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
}

- (void)_CreateSubView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 2, kScreenWidth, kScreenHeight-kNavigationBarHeight)];
    _tableView.backgroundColor=[UIColor clearColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"MessageInformTableViewCell" bundle:nil] forCellReuseIdentifier:kMessageInformTableViewCellIdentifier];
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageInformTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kMessageInformTableViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 83;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES ];
}

@end

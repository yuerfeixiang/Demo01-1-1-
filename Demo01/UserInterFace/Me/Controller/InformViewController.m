//
//  InformViewController.m
//  Demo01
//
//  Created by Deo on 15/10/22.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "InformViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "InformTableViewCell.h"

#define kInformTableViewCellIdentifier @"k_Inform_TableView_Cell_ID"
@interface InformViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSArray *_titArr;
}

@end

@implementation InformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    
    [self requestData];
    [self _createNaviView];
    [self _createTableView];
}

//获取数据
- (void)requestData{
    _titArr=@[@"推送声音",@"推送震动",@"系统通知",@"评论回复",@"新粉丝",@"点赞",@"私聊",@"桌面上图标显示",@"夜间免打扰"];
    [_tableView reloadData];
}

//创建导航视图
- (void)_createNaviView{
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
    
}

//创建列表表示图
- (void)_createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight-kNavigationBarHeight)];
    _tableView.scrollEnabled=NO;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.separatorColor=[UIColor clearColor];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerNib:[UINib nibWithNibName:@"InformTableViewCell" bundle:nil] forCellReuseIdentifier:kInformTableViewCellIdentifier];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else{
        return 8;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        UITableViewCell *cell=[[UITableViewCell alloc]init];
        cell.backgroundColor=[UIColor clearColor];
        cell.contentView.backgroundColor=[UIColor clearColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.section==0) {
            return cell;
        }else{
            UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 3, kScreenWidth, 15)];
            bgView.backgroundColor=[UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1];
            [cell.contentView addSubview:bgView];
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 120, 15)];
            nameLabel.font=[UIFont systemFontOfSize:11];
            nameLabel.text=@"开启以下消息的通知";
            nameLabel.textColor=[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
            [bgView addSubview:nameLabel];
            return cell;
        }
    }else{
        InformTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kInformTableViewCellIdentifier forIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.section==0) {
            cell.infoListLabel.text=_titArr[indexPath.row-1];
        }else{
            cell.infoListLabel.text=_titArr[indexPath.row+1];
            
        }
        if (indexPath.row%2==0) {
            cell.openSwitch.on=YES;
        }else{
            cell.openSwitch.on=NO;
        }
        if (indexPath.row==7) {
            cell.timeLabel.text=@"(23:00 - 8:00)";
        }else{
            [cell.timeLabel removeFromSuperview];
        }
        return cell;
    }
}

#pragma mark - TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        if (indexPath.section==0) {
            return 6;
        }else{
            return 18;
        }
    }else{
        return 52;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

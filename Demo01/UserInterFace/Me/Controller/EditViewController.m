//
//  EditViewController.m
//  Demo01
//
//  Created by Deo on 15/10/21.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "EditViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "AccountViewController.h"
#import "PrivacyViewController.h"
#import "InformViewController.h"

#import "IdeaViewController.h"
#import "EditListTableViewCell.h"

#define kEditListTableViewCellIdentifier @"k_Edit_List_TableView_Cell_ID"

@interface EditViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSArray *_titArr;
}

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];

    [self requestData];
    [self _createNaviView];
    [self _createTableView];
    [self _createFootView];
}
//获取数据
- (void)requestData{
    _titArr=@[@"账号与安全",@"隐私",@"通知",@"给我评分",@"关于舞蹈圈",@"清除缓存",@"用户反馈"];
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
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight+3, kScreenWidth, kScreenHeight-kTabBarHeight-kNavigationBarHeight)];
    _tableView.scrollEnabled=NO;
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerNib:[UINib nibWithNibName:@"EditListTableViewCell" bundle:nil] forCellReuseIdentifier:kEditListTableViewCellIdentifier];
}

//创建尾视图
- (void)_createFootView{
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 89)];
    footView.backgroundColor=[UIColor clearColor];
    
    UIButton *quitButton=[UIButton buttonWithType:UIButtonTypeCustom];
    quitButton.frame=CGRectMake((kScreenWidth-254)/2, 45, 254, 44);
    [quitButton setBackgroundImage:[UIImage imageNamed:@"设置退出当前账号2@"] forState:UIControlStateNormal];
    [quitButton setTitle:@" 退出当前账号" forState:UIControlStateNormal];
    [quitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [footView addSubview:quitButton];
    _tableView.tableFooterView=footView;
}

- (void)viewDidAppear:(BOOL)animated{
    
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EditListTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kEditListTableViewCellIdentifier forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleDefault;
    cell.titleNameLabel.text=_titArr[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if (indexPath.row==5) {
        cell.rightImgView.hidden=YES;
        UILabel *ramLabel=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-20-60, 17, 60, 15)];
        ramLabel.textColor=[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
        ramLabel.font=[UIFont systemFontOfSize:13];
        ramLabel.textAlignment=NSTextAlignmentRight;
        ramLabel.text=@"10MB";
        [cell.contentView addSubview:ramLabel];
    }
    return cell;
}

#pragma mark - TableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        AccountViewController *accountVC=[[AccountViewController alloc]init];
        UINavigationController *naviVC=[[UINavigationController alloc]initWithRootViewController:accountVC];
        [self presentViewController:naviVC animated:NO completion:nil];
    }else if (indexPath.row==2) {
        InformViewController *informVC=[[InformViewController alloc]init];
        informVC.title=@"通知";
        [self presentViewController:informVC animated:YES completion:nil];
    }else if (indexPath.row==1){
        UIStoryboard *stb=[UIStoryboard storyboardWithName:@"Me" bundle:nil];
        PrivacyViewController *priVc=[stb instantiateViewControllerWithIdentifier:@"PrivacyViewControllerID"];
        
        [self presentViewController:priVc animated:YES completion:nil];
    }else if (indexPath.row==6){
        IdeaViewController *ideaVC=[[IdeaViewController alloc]init];
        UINavigationController *naviVC=[[UINavigationController alloc]initWithRootViewController:ideaVC];
        [self presentViewController:naviVC animated:NO completion:nil];
    }
    
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  SearchUserTableView.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "SearchUserTableView.h"

#import "Common.h"
#import "UIView+UIViewController.h"

#import "OtherInCenterViewController.h"
#import "SearchUserTableViewCell.h"
#define kSearchUserTableViewCellIdentifier @"k_Search_User_TableView_Cell_Identifier"

@implementation SearchUserTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor clearColor];
        self.separatorStyle=UITableViewCellSeparatorStyleNone;
        [self registerNib:[UINib nibWithNibName:@"SearchUserTableViewCell" bundle:nil] forCellReuseIdentifier:kSearchUserTableViewCellIdentifier];

        [self _createSubView];
    }
    
    return self;
}

- (void)_createSubView{
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 35)];
    footView.backgroundColor=[UIColor clearColor];
    UILabel *footLabel=[[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-100)/2, 15, 100, 15)];
    footLabel.text=@"暂无更多";
    footLabel.textColor=HEXCOLOR(0xbcbcbc);
    footLabel.textAlignment=NSTextAlignmentCenter;
    footLabel.font=TEXT_FONT(13);
    [footView addSubview:footLabel];
    
    self.tableFooterView=footView;
    
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 32)];
    headView.backgroundColor=[UIColor clearColor];
    
    UIView *labelView=[[UIView alloc]initWithFrame:CGRectMake(0, 5, kScreenWidth, 22)];
    labelView.backgroundColor=[UIColor whiteColor];
    [headView addSubview:labelView];
    
    UILabel *headLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 3, 100, 15)];
    headLabel.text=@"搜索结果";
    headLabel.textColor=HEXCOLOR(0x939393);
    headLabel.font=TEXT_FONT(13);
    [labelView addSubview:headLabel];
    
    self.tableHeaderView=headView;
}


#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchUserTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kSearchUserTableViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OtherInCenterViewController *otherInCenterVC=[[OtherInCenterViewController alloc]init];
    [self.viewController presentViewController:otherInCenterVC animated:YES completion:nil];
}
@end

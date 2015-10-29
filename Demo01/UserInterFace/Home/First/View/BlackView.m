//
//  BlackView.m
//  Demo01
//
//  Created by Deo on 15/10/12.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "BlackView.h"
#import "Common.h"
#import "UIViewExt.h"

#define kBlackTableViewCellIdentifier @"kBlack_Table_View_Cell_Identifier"
@implementation BlackView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:self.bounds];
        imgView.image=[UIImage imageNamed:@"弹窗2@"];
        [self addSubview:imgView];
        [self createChoiceTableView];
    }
    return self;
}

- (void)createChoiceTableView{
    _choiceTableView=[[UITableView alloc]initWithFrame:CGRectMake(5, 9, kScreenWidth-25, self.height-9) style:UITableViewStylePlain];
    _choiceTableView.dataSource=self;
    _choiceTableView.delegate=self;
    
    _choiceTableView.backgroundColor=[UIColor clearColor];
    [_choiceTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kBlackTableViewCellIdentifier];
    [self addSubview:_choiceTableView];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kBlackTableViewCellIdentifier];
    cell.backgroundColor=[UIColor clearColor];
    UIImageView *enNameView=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/3, 25, 25, 10)];
    UILabel *cTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(enNameView.right+30, 22, 50, 19)];
    cTitleLabel.font=[UIFont systemFontOfSize:17];
    cTitleLabel.textColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    [cell.contentView addSubview:enNameView];
    [cell.contentView addSubview:cTitleLabel];
    if (indexPath.row==0) {
        enNameView.width=20;
        enNameView.image=[UIImage imageNamed:@"hot2@_2"];
        cTitleLabel.text=@"热门";
    }else if (indexPath.row==1){
        enNameView.width=25;
        enNameView.image=[UIImage imageNamed:@"new2@"];
        cTitleLabel.text=@"最新";
    }else if (indexPath.row==2){
        enNameView.frame=CGRectMake(kScreenWidth/3, 25, 10, 14);
        enNameView.image=[UIImage imageNamed:@"附近2@"];
        cTitleLabel.text=@"附近";

    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end

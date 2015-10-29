//
//  AddView.m
//  Demo01
//
//  Created by Deo on 15/10/14.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "AddView.h"

#import "UIViewExt.h"

@implementation AddView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self requestData];
        UIImage *img=[UIImage imageNamed:@"消息界面弹窗2@"];
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:self.bounds];
        imgView.image=img;
        imgView.userInteractionEnabled=YES;
        [self addSubview:imgView];
        [self _createTableView];
 
    }
    return self;
}

- (void)requestData{
    _imgArr=@[@"添加好友2@",@"发起聊天2@",@"我的群组2@"];
    _titArr=@[@"添加好友",@"发起聊天",@"我的群组"];
}

- (void)_createTableView{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 11, self.width, self.height-11) style:UITableViewStylePlain];
    tableView.backgroundColor=[UIColor clearColor];
    tableView.separatorColor=[UIColor blackColor];
    tableView.dataSource=self;
    tableView.delegate=self;
    [self addSubview:tableView];
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    cell.backgroundColor=[UIColor clearColor];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(18, 20, 20, 18)];
    imgView.image=[UIImage imageNamed:_imgArr[indexPath.row]] ;
    [cell.contentView addSubview:imgView];
    
    UILabel *titLabel=[[UILabel alloc]initWithFrame:CGRectMake(imgView.right+18, 20, self.width-imgView.right-18, 20)];
    titLabel.backgroundColor=[UIColor clearColor];
    titLabel.textColor=[UIColor whiteColor];
    titLabel.text=_titArr[indexPath.row];
    [cell.contentView addSubview:titLabel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 53;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end

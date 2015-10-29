//
//  VideoTableView.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "VideoTableView.h"
#import "dancevideoViewController.h"
#import "VideoTableViewCell.h"
#import "UIView+UIViewController.h"
#define kVideoTableViewCellIdentifier @"k_Video_TableView_Cell_Identifier"

@implementation VideoTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.separatorColor=[UIColor clearColor];
        [self registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:kVideoTableViewCellIdentifier];
    }
    return self;
}


#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kVideoTableViewCellIdentifier forIndexPath:indexPath];
    cell.postImgView.image=[UIImage imageNamed:[NSString stringWithFormat:@"new图2@_%1ld",(long)indexPath.row+2]];
    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dancevideoViewController *dance = [[dancevideoViewController alloc]init];
    [self.viewController.navigationController pushViewController:dance animated:YES];
}
@end

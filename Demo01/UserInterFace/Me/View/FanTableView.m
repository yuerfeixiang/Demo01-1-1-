//
//  FanTableView.m
//  Demo01
//
//  Created by Deo on 15/10/20.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "FanTableView.h"

#import "MaskTableViewCell.h"
#define kMaskTableViewCellIdentifier @"kMask_TableView_Cell_Identifier"
@implementation FanTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.dataSource=self;
        self.delegate=self;
        self.separatorColor=[UIColor clearColor];
        [self registerNib:[UINib nibWithNibName:@"MaskTableViewCell" bundle:nil] forCellReuseIdentifier:kMaskTableViewCellIdentifier];
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
    
    MaskTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kMaskTableViewCellIdentifier forIndexPath:indexPath];
    [cell.isMaskButton setImage:[UIImage imageNamed:@"粉丝加关注2@"] forState:UIControlStateNormal];
    [cell.isMaskButton setImage:[UIImage imageNamed:@"粉丝好友2@"] forState:UIControlStateSelected];

    return cell;
}


#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


@end

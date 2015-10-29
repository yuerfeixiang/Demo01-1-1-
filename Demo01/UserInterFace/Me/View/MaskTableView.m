//
//  MaskTableView.m
//  Demo01
//
//  Created by Deo on 15/10/20.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MaskTableView.h"

#import "MaskTableViewCell.h"
#define kMaskTableViewCellIdentifier @"kMask_TableView_Cell_Identifier"

@implementation MaskTableView

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
    return cell;
}


#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
@end

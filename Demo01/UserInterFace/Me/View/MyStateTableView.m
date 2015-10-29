//
//  MyStateTableView.m
//  Demo01
//
//  Created by Deo on 15/10/20.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "MyStateTableView.h"

#import "MyStateTableViewCell.h"

#define kMyStateTableViewViewCellIdentifier @"kMy_State_TableView_Cell_Identifier"


@implementation MyStateTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.dataSource=self;
        self.delegate=self;
        self.separatorColor=[UIColor clearColor];
        [self registerNib:[UINib nibWithNibName:@"MyStateTableViewCell" bundle:nil] forCellReuseIdentifier:kMyStateTableViewViewCellIdentifier];
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
    
    MyStateTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kMyStateTableViewViewCellIdentifier forIndexPath:indexPath];
    return cell;
}


#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
@end

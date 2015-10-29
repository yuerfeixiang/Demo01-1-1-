//
//  ChangeScrollView.m
//  Demo01
//
//  Created by Deo on 15/10/26.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "ChangeScrollView.h"
#import "Common.h"
#import "UIViewExt.h"

@implementation ChangeScrollView

- (instancetype)initWithFrame:(CGRect)frame withFirstTableView:(UITableView *)firstTableView withSecondTableView:(UITableView *)secondTableView withThirdTableView:(UITableView *)thirdTableView{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        self.contentSize=CGSizeMake(kScreenWidth*3, self.height);
        self.pagingEnabled=YES;
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        self.scrollsToTop=NO;
        self.backgroundColor=[UIColor clearColor];
        
        [self addSubview:firstTableView];
        [self addSubview:secondTableView];
        [self addSubview:thirdTableView];
    }
    
    return self;
}


@end

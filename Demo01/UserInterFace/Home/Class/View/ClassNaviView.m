//
//  ClassNaviView.m
//  Demo01
//
//  Created by Deo on 15/10/15.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "ClassNaviView.h"
#import "Common.h"

@implementation ClassNaviView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self _createSubView];
    }
    return self;
}

- (void)_createSubView{

    self.backgroundColor=[UIColor clearColor];
    _backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame=CGRectMake(10, 32, 12, 20);

    [_backButton setImage:[UIImage imageNamed:@"返回2@_1"]
                forState:UIControlStateNormal];
    [self addSubview:_backButton];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-100)/2, 32, 100, 20)];
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.font=[UIFont systemFontOfSize:17];
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
}


@end

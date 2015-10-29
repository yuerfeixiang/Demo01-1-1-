//
//  IWSearchBar.m
//  9期微博
//
//  Created by teacher on 14-9-29.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWSearchBar.h"
#import "UIImage+NJ.h"

@implementation IWSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 2.设置UITextField的背景图片
        self.background = [UIImage resizableImageWithName:@"底部背景2@"];
        // 3.设置文本垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        // 4.添加放大镜
        UIImageView *iv = [[UIImageView alloc] init];
        iv.image = [UIImage imageWithNmae:@"搜索2@"];
        iv.frame = CGRectMake(0, 0, 35, 35);
        iv.contentMode = UIViewContentModeCenter;
        //    [searchBar addSubview:iv];
        self.leftView = iv;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        // 5.添加清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        // 6.设置提示文本
        self.placeholder = @"请输入需要搜索的内容";
        
        // 7.设置字体
        self.font = [UIFont systemFontOfSize:13];

    }
    return self;
}


@end

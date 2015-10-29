//
//  PageChoiceView.m
//  Demo01
//
//  Created by Deo on 15/10/19.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "PageChoiceView.h"

#import "UIViewExt.h"
#import "UIView+UIViewController.h"

#import "PersonInCenterViewController.h"

static PageChoiceView *instance=nil;
@implementation PageChoiceView

+ (instancetype)sharedInstance{
    if (instance==nil) {
        instance=[[PageChoiceView alloc]init];
    }
    return instance;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _titArr=@[@"动态",@"标签",@"关注",@"粉丝"];
        [self _createSubViews];
    }
    
    return self;
}

- (void)_createSubViews{
    _selectedIndex=2000;
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake((self.width-5*30-4*40)/2, (self.height-15)/2, 30, 15)];
    titleLabel.font=[UIFont systemFontOfSize:15];
    titleLabel.textColor=[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1];
    titleLabel.text=@"主页";
    [self addSubview:titleLabel];
    for (int i=0; i<4; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(titleLabel.right+40+i*(40+30), (self.height-40)/2, 30, 40);
        
        //设置按钮的标题格式
        button.titleLabel.lineBreakMode=NSLineBreakByWordWrapping;
        button.titleLabel.font=[UIFont systemFontOfSize:11];
        button.titleLabel.textAlignment=NSTextAlignmentCenter;
        NSString *titleName=[NSString stringWithFormat:@"%@\n%@",@80,_titArr[i]];
        [button setTitle:titleName forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:101/255.0 green:104/255.0 blue:105/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:45/255.0 green:153/255.0 blue:254/255.0 alpha:1] forState:UIControlStateSelected];
         button.tag=2000+i;
        button.selected=NO;
        [button addTarget:self
                   action:@selector(buttonAction:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        if (i==0) {
            button.selected=YES;
        }
        
    }
}

#pragma mark - ButtonAction
- (void)buttonAction:(UIButton *)sender{
    self.selectedIndex=(int)sender.tag;
    int index=(int)(sender.tag-2000);
    //调用代理方法
    [self.delegate changePageWithIndex:index];
}

- (void)setSelectedIndex:(int )selectedIndex{
    if (_selectedIndex!=selectedIndex) {
        UIButton *proButton=(UIButton *)[self viewWithTag:_selectedIndex];
        proButton.selected=!proButton.selected;
        
        UIButton *currentButton=(UIButton *)[self viewWithTag:selectedIndex];
        currentButton.selected=!currentButton.selected;
        

    }
    
    _selectedIndex=selectedIndex;
    
}
@end

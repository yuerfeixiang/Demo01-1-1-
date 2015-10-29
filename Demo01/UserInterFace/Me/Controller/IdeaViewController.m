//
//  IdeaViewController.m
//  Demo01
//
//  Created by Deo on 15/10/27.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "IdeaViewController.h"

#import "Common.h"

@interface IdeaViewController ()

@end

@implementation IdeaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HEXCOLOR(0xf8f8f8);
    [self _createNaviView];
    
    [self _createSubView];
}

- (void)_createNaviView{
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    titleLabel.textColor=HEXCOLOR(0x656869);
    titleLabel.text=@"意见与隐私";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=titleLabel;
    
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(0, 0, 9, 15);
    [backButton setImage:[UIImage imageNamed:@"灰返回2@"] forState:UIControlStateNormal];
    
    [backButton addTarget:self
                   action:@selector(backButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    //右边按钮
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 54, 27);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"button_blue_bg2@"]
                           forState:UIControlStateNormal];
    [rightButton setTitle:@"提交" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font=TEXT_FONT(15);
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;

}

- (void)_createSubView{
    //意见文本框
    UITextView *ideaTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, 6, kScreenWidth, 232)];
    ideaTextView.backgroundColor=[UIColor whiteColor];
     ideaTextView.text=@"请您在这里填写对舞蹈圈的意见,我们将不断改进，感谢您的支持";
    ideaTextView.contentSize=CGSizeMake(kScreenWidth, 1000);
    //ideaTextView.contentInset=UIEdgeInsetsMake(0, 20, 0, 20);
    ideaTextView.textColor=HEXCOLOR(0xbcbcbc);
    ideaTextView.font=TEXT_FONT(15);
    [self.view addSubview:ideaTextView];
    
    //
    UIView *mothedView=[[UIView alloc]initWithFrame:CGRectMake(0, ideaTextView.bottom+6, kScreenWidth, 49)];
    mothedView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:mothedView];
    
    //联系方式
    UILabel *shipLabel=[[UILabel alloc]initWithFrame:CGRectMake(17, 16, 80, 20)];
    shipLabel.textColor=HEXCOLOR(0x656869);
    shipLabel.text=@"联系方式：";
    shipLabel.font=TEXT_FONT(15);
    [mothedView addSubview:shipLabel];
    
    //QQ／邮箱Field
    UITextField *phoneField=[[UITextField alloc]initWithFrame:CGRectMake(shipLabel.right, 10, 150, 29)];
    phoneField.placeholder=@"请填写你的QQ／邮箱";
    phoneField.font=TEXT_FONT(15);
    phoneField.textColor=HEXCOLOR(0xbcbcbc);
    [mothedView addSubview:phoneField];
}

- (void)backButtonAction:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

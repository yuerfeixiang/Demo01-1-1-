//
//  AccountViewController.m
//  Demo01
//
//  Created by Deo on 15/10/27.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "AccountViewController.h"
#import "Common.h"

@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HEXCOLOR(0xf8f8f8);
    [self _createNaviView];
    [self _createSubView];
}

- (void)_createNaviView{
    
    //标题
    UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    titleLabel.textColor=HEXCOLOR(0x656869);
    titleLabel.text=@"账号与安全";
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.navigationItem.titleView=titleLabel;
    
    //返回按钮
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(0, 0, 9, 15);
    [backButton setImage:[UIImage imageNamed:@"灰返回2@"] forState:UIControlStateNormal];
    
    [backButton addTarget:self
                   action:@selector(backButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=leftItem;
    
}

- (void)_createSubView{
    //手机号
    UIView *phoneView=[[UIView alloc]initWithFrame:CGRectMake(0, 70, kScreenWidth, 62)];
    phoneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:phoneView];
    
    UILabel *mobileLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 24, 60, 16)];
    mobileLabel.textColor=HEXCOLOR(0x656869);
    mobileLabel.text=@"手机号";
    mobileLabel.font=TEXT_FONT(15);
    [phoneView addSubview:mobileLabel];
    
    UILabel *numberLabel=[[UILabel alloc]initWithFrame:CGRectMake(mobileLabel.right+30, 24, 150, 16)];
    numberLabel.text=@"未绑定";
    numberLabel.textColor=HEXCOLOR(0x939393);
    numberLabel.font=TEXT_FONT(13);
    [phoneView addSubview:numberLabel];
    
    UIButton *changeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.frame=CGRectMake(kScreenWidth-20-63, 16, 63, 29);
    [changeButton setTitle:@"绑定号码" forState:UIControlStateNormal];
    changeButton.titleLabel.font=TEXT_FONT(12);
    [changeButton setTitleColor:HEXCOLOR(0x82bdff) forState:UIControlStateNormal];
    [changeButton setBackgroundImage:[UIImage imageNamed:@"unwrap_white2@"] forState:UIControlStateNormal];//未绑定
//    [changeButton setBackgroundImage:[UIImage imageNamed:@"binding_blue2@"] forState:UIControlStateSelected];//已绑定
    [changeButton addTarget:self
                     action:@selector(changeButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    [phoneView addSubview:changeButton];
    
    //修改密码
    UIView *psdView=[[UIView alloc]initWithFrame:CGRectMake(0, phoneView.bottom+3, kScreenWidth, 62)];
    psdView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:psdView];
    
    UILabel *psdLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 24, 65, 16)];
    psdLabel.textColor=HEXCOLOR(0x656869);
    psdLabel.text=@"修改密码";
    psdLabel.font=TEXT_FONT(15);
    [psdView addSubview:psdLabel];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(kScreenWidth-20-9, 23.5, 9, 15);
    [button setImage:[UIImage imageNamed:@"粗右箭头2@"] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(changePsdButtonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    [psdView addSubview:button];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, psdView.bottom+6, kScreenWidth, 21)];
    label.text=@"   你可以使用任意已绑定账号来登录";
    label.font=TEXT_FONT(11);
    label.textColor=HEXCOLOR(0x939393);
    label.backgroundColor=HEXCOLOR(0xe7e7e7);
    [self.view addSubview:label];
    
    NSArray *imgArr=@[@"weixin_logo_li2@",@"qq_logo_li2@",@"weibo_logo_li2@"];
    NSArray *naArr=@[@"微信账号",@"QQ账号",@"微博账号"];
    CGFloat viewHeight=62;
    for (int i=0; i<3; i++) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, label.bottom+(viewHeight+3)*i, kScreenWidth, viewHeight)];
        view.backgroundColor=[UIColor whiteColor];
        UIImageView *logoImgView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 24, 21, 18)];
        logoImgView.image=[UIImage imageNamed:imgArr[i]];
        [view addSubview:logoImgView];
        
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(logoImgView.right+20, 24, 70, 18)];
        nameLabel.text=naArr[i];
        nameLabel.font=TEXT_FONT(15);
        nameLabel.textColor=HEXCOLOR(0x656869);
        [view addSubview:nameLabel];
        
        UIButton *bindingButton=[UIButton buttonWithType:UIButtonTypeCustom];
        bindingButton.frame=CGRectMake(kScreenWidth-20-63, 16.5, 63, 29);
       
        [bindingButton setBackgroundImage:[UIImage imageNamed:@"binding_blue2@"] forState:UIControlStateNormal];//未绑定
        bindingButton.titleLabel.font=TEXT_FONT(13);
        [bindingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bindingButton setTitle:@"绑定" forState:UIControlStateNormal];
        [bindingButton setBackgroundImage:[UIImage imageNamed:@"unwrap_white2@"] forState:UIControlStateSelected];//已绑定
        [bindingButton setTitleColor:HEXCOLOR(0x82bdff) forState:UIControlStateSelected];
        [bindingButton setTitle:@"解绑" forState:UIControlStateSelected];
        [view addSubview:bindingButton];
        [self.view addSubview:view];
        
    }
    
    
}

#pragma mark - ButtonAction
- (void)backButtonAction:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)changeButtonAction:(UIButton *)sender{
    
}

- (void)changePsdButtonAction:(UIButton *)sender{
    
}

@end

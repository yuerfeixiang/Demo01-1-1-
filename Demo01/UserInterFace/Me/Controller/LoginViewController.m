//
//  LoginViewController.m
//  Demo01
//
//  Created by Deo on 15/10/22.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "LoginViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "RegistViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)dealloc{
   // [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    _userTextField.textColor=HEXCOLOR(0x656869);
    _psdTextField.textColor=HEXCOLOR(0x656869);
    _userTextField.delegate=self;
    _psdTextField.delegate=self;
//    //键盘已经显示的通知
//    [[NSNotificationCenter defaultCenter]addObserver:self
//                                            selector:@selector(<#selector#>) name:UIKeyboardDidShowNotification
//                                              object:nil];
//    //键盘已经隐藏的通知
//    [[NSNotificationCenter defaultCenter]addObserver:self
//                                            selector:@selector(<#selector#>) name:UIKeyboardDidHideNotification
//                                              object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}




#pragma mark - TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    [UIView animateWithDuration:.35 animations:^{
//        self.loginlogoImgView.frame=CGRectMake((kScreenWidth-50)/2, 45, 70, 73);
//        self.loginView.frame=CGRectMake(0, 259-45, kScreenWidth, 250);
////        self.logoTopConstraint=[NSLayoutConstraint constraintWithItem:self.loginlogoImgView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:50.f];
//    } completion:nil];
    
    [UIView beginAnimations:@"start" context:nil];
    [UIView setAnimationDuration:.35];
    self.loginlogoImgView.frame=CGRectMake((kScreenWidth-50)/2, 45, 70, 73);
    self.loginView.frame=CGRectMake(0, 259-45, kScreenWidth, 250);
//    self.logoTopConstraint=[NSLayoutConstraint constraintWithItem:self.loginlogoImgView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:45.f];

    [UIView commitAnimations];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.userTextField resignFirstResponder];
    [self.psdTextField resignFirstResponder];//收起键盘
    
    [UIView beginAnimations:@"end" context:nil];
    [UIView setAnimationDuration:.35];
    self.loginlogoImgView.frame=CGRectMake((kScreenWidth-95)/2, 95, 115, 119);
    self.loginView.frame=CGRectMake(0, 259, kScreenWidth, 250);
    [UIView commitAnimations];
    

    
//    [UIView animateWithDuration:.35 animations:^{
//        self.loginlogoImgView.frame=CGRectMake((kScreenWidth-95)/2, 45, 115, 73);
//        self.loginView.frame=CGRectMake(0, 259-45, kScreenWidth, 250);
//
//    } completion:nil];

    
    return YES;
}

#pragma mark - ButtonAction
- (void)loginButtonAction:(UIButton *)sender {
    
}
- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)regButtonAction:(UIButton *)sender {
    UIStoryboard *stb=[UIStoryboard storyboardWithName:@"Me" bundle:nil];
    RegistViewController *registVC=[stb instantiateViewControllerWithIdentifier:@"RegistViewControllerID"];
    if (sender.tag==3000) {
        registVC.title=@"找回密码";
    }else{
        registVC.title=@"注册朋友圈";
    }
    [self presentViewController:registVC animated:YES completion:nil];
}


@end

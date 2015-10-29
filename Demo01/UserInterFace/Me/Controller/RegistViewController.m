//
//  RegistViewController.m
//  Demo01
//
//  Created by Deo on 15/10/22.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "RegistViewController.h"

#import "SetPassdViewController.h"
#import "Common.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleLabel.text=self.title;
    
    _mobilNumTextFiled.textColor=HEXCOLOR(0x656869);
    _verifTextField.textColor=HEXCOLOR(0x656869);
}

- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)senderButtonAction:(id)sender {
    
    NSLog(@"发送验证码");
}
- (IBAction)nextButtonAction:(id)sender {
    UIStoryboard *stb=[UIStoryboard storyboardWithName:@"Me" bundle:nil];
    SetPassdViewController *setPassdVC=[stb instantiateViewControllerWithIdentifier:@"SetPassdViewControllerID"];
    if ([self.title isEqualToString:@"找回密码"]) {
        setPassdVC.title=@"修改密码";
    }else{
        setPassdVC.title=@"设置密码";
    }
    [self presentViewController:setPassdVC animated:YES completion:nil];
}

@end

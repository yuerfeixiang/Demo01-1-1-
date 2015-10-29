//
//  SetPassdViewController.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "SetPassdViewController.h"
#import "Common.h"

@interface SetPassdViewController ()

@end

@implementation SetPassdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.text=self.title;

    _passdTextField.textColor=HEXCOLOR(0x656869);
    _checkTextField.textColor=HEXCOLOR(0x656869);
}




- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)yesButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

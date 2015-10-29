//
//  PrivacyViewController.m
//  Demo01
//
//  Created by Deo on 15/10/26.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "PrivacyViewController.h"

#import "Common.h"

@interface PrivacyViewController ()

@end

@implementation PrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.textColor=HEXCOLOR(0x656869);
    self.view.backgroundColor=HEXCOLOR(0xf8f8f8);
    _addLabel.textColor=HEXCOLOR(0x656869);
    _allLabel.textColor=HEXCOLOR(0x656869);
    _priInfoLabel.textColor=HEXCOLOR(0xbcbcbc);
    _priLabel.textColor=HEXCOLOR(0x656869);
    _attentLabel.textColor=HEXCOLOR(0x656869);
    _blackListLabel.textColor=HEXCOLOR(0x656869);
    _balckIntoLabel.textColor=HEXCOLOR(0xbcbcbc);
    _whichLabel.textColor=HEXCOLOR(0xbcbcbc);
    _whichLabel.backgroundColor=HEXCOLOR(0xe7e7e7);
    
    [_allPersonButton setImage:[UIImage imageNamed:@"cycle_green2@"] forState:UIControlStateSelected];
    _allPersonButton.selected=YES;
    [_allPersonButton setImage:[UIImage imageNamed:@"cycle_white2@"] forState:UIControlStateNormal];
    [_myAttentionButton setImage:[UIImage imageNamed:@"cycle_green2@"] forState:UIControlStateSelected];
    [_myAttentionButton setImage:[UIImage imageNamed:@"cycle_white2@"] forState:UIControlStateNormal];
}

// 允许通过手机通讯录加好友按钮
- (IBAction)allowAddButton:(id)sender {
}

//在附近中隐身按钮
- (IBAction)cloakButton:(id)sender {
}

//接受所有人私信
- (IBAction)allPerson:(id)sender {
}

//只接受关注的人
- (IBAction)myAttentionButtonAction:(id)sender {
}
- (IBAction)backButtonAction:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

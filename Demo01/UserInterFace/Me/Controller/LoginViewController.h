//
//  LoginViewController.h
//  Demo01
//
//  Created by Deo on 15/10/22.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *loginlogoImgView;
@property (strong, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *psdTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoTopConstraint;

@end

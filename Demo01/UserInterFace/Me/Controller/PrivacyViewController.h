//
//  PrivacyViewController.h
//  Demo01
//
//  Created by Deo on 15/10/26.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrivacyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (weak, nonatomic) IBOutlet UILabel *addLabel;//加我好友
@property (weak, nonatomic) IBOutlet UILabel *priLabel;//隐身
@property (weak, nonatomic) IBOutlet UILabel *priInfoLabel;//隐身说明
@property (weak, nonatomic) IBOutlet UILabel *whichLabel;//接受哪些人的私信
@property (weak, nonatomic) IBOutlet UILabel *allLabel;//所有人
@property (weak, nonatomic) IBOutlet UILabel *attentLabel;//关注的人
@property (weak, nonatomic) IBOutlet UILabel *blackListLabel;//黑名单
@property (weak, nonatomic) IBOutlet UILabel *balckIntoLabel;//黑名单说明
@property (weak, nonatomic) IBOutlet UISwitch *addFriendButton;//
@property (weak, nonatomic) IBOutlet UISwitch *cloakButton;//
@property (weak, nonatomic) IBOutlet UIButton *allPersonButton;//
@property (weak, nonatomic) IBOutlet UIButton *myAttentionButton;//

@end

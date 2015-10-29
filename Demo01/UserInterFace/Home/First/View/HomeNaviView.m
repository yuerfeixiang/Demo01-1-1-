//
//  HomeNaviView.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "HomeNaviView.h"

#import "Common.h"
#import "UIViewExt.h"
#import "UIView+UIViewController.h"

#import "SearchClassViewController.h"
#import "HotSearchViewController.h"

@implementation HomeNaviView

- (void)awakeFromNib{
    
    self.selectedImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 54, 22)];
//    [self addSubview:self.selectedImgView];
    [self insertSubview:self.selectedImgView atIndex:1];

    [_classButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_classButton setTitleColor:[UIColor colorWithHue:28/255.0 saturation:28/255.0 brightness:28/255.0 alpha:1] forState:UIControlStateSelected];
    [_classButton setBackgroundColor:[UIColor clearColor]];
    
    [_danceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_danceButton setTitleColor:[UIColor colorWithHue:28/255.0 saturation:28/255.0 brightness:28/255.0 alpha:1] forState:UIControlStateSelected];
    [_danceButton setBackgroundColor:[UIColor clearColor]];
    
    [_gzButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_gzButton setTitleColor:[UIColor colorWithHue:28/255.0 saturation:28/255.0 brightness:28/255.0 alpha:1] forState:UIControlStateSelected];
    [_gzButton setBackgroundColor:[UIColor clearColor]];
    
    
    self.selectedImgView.center=_classButton.center;
    }
- (IBAction)classAction:(id)sender {
    [self.delegate changeView:1];
    self.selectedImgView.width=54;
    self.selectedImgView.image=[UIImage imageNamed:@"selected_back_white2@"];
    self.selectedImgView.center=self.classButton.center;
}
- (IBAction)danceAction:(id)sender {
    [self.delegate changeView:2];
    self.selectedImgView.width=70;
    self.selectedImgView.image=[UIImage imageNamed:@"舞蹈圈2@"];
     self.selectedImgView.center=self.danceButton.center;
}
- (IBAction)gzAction:(id)sender {
    [self.delegate changeView:3];
    self.selectedImgView.width=54;
    self.selectedImgView.image=[UIImage imageNamed:@"selected_back_white2@"];
     self.selectedImgView.center=self.gzButton.center;
}
- (IBAction)searchAction:(UIButton *)sender {
    if(_classButton.selected==YES){
        SearchClassViewController *searchClassVC=[[SearchClassViewController alloc]init];
        [self.viewController presentViewController:searchClassVC animated:NO completion:nil];
    }else if(_danceButton.selected==YES){
        HotSearchViewController *hotSearchVC=[[HotSearchViewController alloc]init];
        [self.viewController presentViewController:hotSearchVC animated:NO completion:nil];
    }
    
}

@end

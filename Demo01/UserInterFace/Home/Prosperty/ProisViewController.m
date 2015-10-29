//
//  ProisViewController.m
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "ProisViewController.h"
#import "BannerView.h"
#import "Common.h"
#import "HomeNaviView.h"

@interface ProisViewController (){
    BannerView *_bannerView;
}

@end

@implementation ProisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bannerView=[[BannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 190)];
    
    [self.view addSubview:_bannerView];
    
    
    [self createLeaderView];
}

- (void)createLeaderView{
    
    HomeNaviView *naviView=[[[NSBundle mainBundle]loadNibNamed:@"HomeNaviView" owner:self options:nil] lastObject];
    naviView.classButton.selected=NO;
    naviView.danceButton.selected=NO;
    naviView.gzButton.selected=YES;
    naviView.selectedImgView.center=naviView.gzButton.center;
    [self.view addSubview:naviView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

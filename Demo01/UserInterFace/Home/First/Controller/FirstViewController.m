//
//  FirstViewController.m
//  
//
//  Created by 俞家模 on 15/10/9.
//
//

#import "FirstViewController.h"

#import "Common.h"

#import "ClassView.h"
#import "DanceView.h"
#import "ProisView.h"
#import "UIViewExt.h"

#import "HomeNaviView.h"
@interface FirstViewController (){
    HomeNaviView *_naviView;
}

@end

@implementation FirstViewController


//- (void)dealloc{
//    //移除通知
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [self createSubView];
    [self createLeaderView];
}

- (void)createLeaderView{
    
    _naviView=[[[NSBundle mainBundle]loadNibNamed:@"HomeNaviView" owner:self options:nil] lastObject];
    _naviView.frame=CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight);
    //_naviView.classLeftConstrain=[NSNumber numberWithFloat:kScreenWidth*(80/375.0)];
    _naviView.delegate=self;
    _naviView.alpha=0.9;
    _naviView.selectedImgView.width=70;
    _naviView.selectedImgView.image=[UIImage imageNamed:@"舞蹈圈2@"];
    _naviView.classButton.selected=NO;
    _naviView.danceButton.selected=YES;
    _naviView.gzButton.selected=NO;
    _naviView.selectedImgView.center=_naviView.danceButton.center;
    [self.view addSubview:_naviView];
    
}

- (void)createSubView{
    
    _classView=[[ClassView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight)];
    _classView.hidden=YES;
    [self.view addSubview:_classView];
    
    _danceView=[[DanceView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight)];
    _danceView.hidden=NO;
    [self.view addSubview:_danceView];

    _proisView=[[ProisView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight)];
    _proisView.hidden=YES;
    [self.view addSubview:_proisView];

}

- (void)changeView:(int)index{
    if (index==1) {
        self.classView.hidden=NO;
        self.danceView.hidden=YES;
        self.proisView.hidden=YES;
        _naviView.classButton.selected=YES;
        _naviView.danceButton.selected=NO;
        _naviView.gzButton.selected=NO;
        _naviView.searchButton.hidden=NO;
    }else if (index==2) {
        self.classView.hidden=YES;
        self.danceView.hidden=NO;
        self.proisView.hidden=YES;
        _naviView.classButton.selected=NO;
        _naviView.danceButton.selected=YES;
        _naviView.gzButton.selected=NO;
        _naviView.searchButton.hidden=NO;
        _naviView.selectedImgView.center=_naviView.danceButton.center;
    }else if (index==3) {
        self.classView.hidden=YES;
        self.danceView.hidden=YES;
        self.proisView.hidden=NO;
        _naviView.classButton.selected=NO;
        _naviView.danceButton.selected=NO;
        _naviView.gzButton.selected=YES;
        _naviView.searchButton.hidden=YES;
        _naviView.selectedImgView.center=_naviView.gzButton.center;
    }
}
    
@end

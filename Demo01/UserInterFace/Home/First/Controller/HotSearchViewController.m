//
//  HotSearchViewController.m
//  Demo01
//
//  Created by Deo on 15/10/23.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "HotSearchViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "SearchUserTableView.h"
#import "SearchTagTableView.h"
#import "SearchContentTableView.h"
#import "ChangeScrollView.h"

@interface HotSearchViewController ()<UISearchBarDelegate,UIScrollViewDelegate>{
    UISearchBar *_searchBar;
    UIView *_choiceView;
    ChangeScrollView *_changeScrollView;
}

@end

@implementation HotSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HEXCOLOR(0xf8f8f8);
    _selectedIndex=1;
    [self _createNaviView];
    
    [self _createChoiceView];
    
    [self _createScrollView];
}

- (void)_createNaviView{
    //导航视图
    UIView *_naviView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
    _naviView.backgroundColor=[UIColor colorWithRed:28/255.0
                                              green:28/255.0 blue:28/255.0
                                              alpha:0.8];
    [self.view addSubview:_naviView];
    
    //搜索框
    
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth-22-40 , 44)];
    _searchBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"backg2@"]];
    [_searchBar.layer setMasksToBounds:YES];
    //_searchBar.backgroundColor=[UIColor clearColor];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"搜索";
    _searchBar.tintColor = HEXCOLOR(0x2d99fe);
    //[_searchBar setBarTintColor:[UIColor clearColor]];
    _searchBar.barStyle = UIBarStyleBlack;
    [_naviView addSubview:_searchBar];
    
    //取消按钮
    UIButton *cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame=CGRectMake(kScreenWidth-62, 32, 40, 20);
    cancelButton.titleLabel.font=TEXT_FONT(17);
    [cancelButton setTitleColor:HEXCOLOR(0x2d99fe) forState:UIControlStateNormal];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self
                     action:@selector(cancelButtonAction:)
           forControlEvents:UIControlEventTouchUpInside];
    [_naviView addSubview:cancelButton];
}

- (void)_createChoiceView{
    NSArray *titArr=@[@"标签",@"用户",@"内容"];
    _choiceView=[[UIView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, 44)];
    _choiceView.backgroundColor=[UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.94];
    [self.view addSubview:_choiceView];

    CGFloat buttonWidth=kScreenWidth/3;
    for (int i=0; i<3; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0+buttonWidth*i, 0, buttonWidth, 44);
        button.tag=2000+i;
        [button setTitle:titArr[i]
                forState:UIControlStateNormal];
        button.titleLabel.font=TEXT_FONT(17);
        [button setTitleColor:HEXCOLOR(0x939393)
                     forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x2d99fe)
                     forState:UIControlStateSelected];
        [button setBackgroundColor:[UIColor clearColor]];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_choiceView addSubview:button];
        if (i==_selectedIndex) {
            button.selected=YES;
        }
    }
}

- (void)_createScrollView{
    SearchTagTableView *tagTableView=[[SearchTagTableView alloc]initWithFrame:CGRectMake(kScreenWidth*0, 0, kScreenWidth,kScreenHeight-kNavigationBarHeight-44)];
    SearchUserTableView *userTableView=[[SearchUserTableView alloc]initWithFrame:CGRectMake(kScreenWidth*1, 0, kScreenWidth, kScreenHeight-kNavigationBarHeight-44)];
    SearchContentTableView *contentTableView=[[SearchContentTableView alloc]initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth, kScreenHeight-kNavigationBarHeight-44)];
    
    _changeScrollView=[[ChangeScrollView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight+44, kScreenWidth, kScreenHeight-kNavigationBarHeight-44) withFirstTableView:tagTableView withSecondTableView:userTableView withThirdTableView:contentTableView];
    _changeScrollView.contentSize=CGSizeMake(kScreenWidth*3, _changeScrollView.height);
    _changeScrollView.pagingEnabled=YES;
    _changeScrollView.delegate=self;
    _changeScrollView.contentOffset=CGPointMake(kScreenWidth*_selectedIndex, 0);
    [self.view addSubview:_changeScrollView];

    
}

- (void)setSelectedIndex:(int)selectedIndex{
    if (_selectedIndex!=selectedIndex) {
        UIButton *preButton=(UIButton *)[_choiceView viewWithTag:(_selectedIndex+2000)];
        preButton.selected=!preButton.selected;
        
        UIButton *currentButton=(UIButton *)[_choiceView viewWithTag:(selectedIndex+2000)];
        currentButton.selected=!currentButton.selected;
        
        _changeScrollView.contentOffset=CGPointMake(kScreenWidth*selectedIndex, 0);
        _selectedIndex=selectedIndex;
    }
    
}

#pragma mark - ButtonAction
- (void)buttonAction:(UIButton *)sender{
    self.selectedIndex=(int)sender.tag-2000;
}

- (void)cancelButtonAction:(UIButton *)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ScrollView Delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.selectedIndex=scrollView.contentOffset.x/kScreenWidth;

}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    }
@end

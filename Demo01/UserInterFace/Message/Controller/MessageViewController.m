//
//  MessageViewController.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "MessageViewController.h"

#import "AddView.h"
#import "ListCollectionViewCell.h"
#import "MessageInformViewController.h"

#import "UIViewExt.h"
#import "Common.h"
#define kListCollectionViewCellIdentifier @"kList_CollectionViewCell_Identifier"
@interface MessageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    AddView *_addView;
    
    UICollectionView *_listCollectionView;
}
@property(nonatomic,strong)NSMutableArray *data;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data=[NSMutableArray array];
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    self.navigationController.navigationBar.backgroundColor=[UIColor whiteColor];
    [self _createNaviItem];
    [self _createSubViews];
    
}

#pragma mark - 创建子视图
- (void)_createNaviItem{
    UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(0, 0, 20, 20);
    [rightButton setImage:[UIImage imageNamed:@"右上角2@"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem=rightItem;
}

- (void)_createSubViews{
    
    //消息列表视图
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=11;
    layout.itemSize=CGSizeMake(kScreenWidth, 62);
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    CGRect frame=CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight-kNavigationBarHeight-kTabBarHeight);
    _listCollectionView=[[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    [_listCollectionView registerNib:[UINib nibWithNibName:@"ListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kListCollectionViewCellIdentifier];
    _listCollectionView.backgroundColor=[UIColor clearColor];
    
    _listCollectionView.dataSource=self;
    _listCollectionView.delegate=self;
    [self.view addSubview:_listCollectionView];
    
    //弹出视图
    _addView=[[AddView alloc]initWithFrame:CGRectMake(kScreenWidth/2-7, kNavigationBarHeight, kScreenWidth/2, 171)];
    _addView.alpha=0;
    [self.view addSubview:_addView];
}


#pragma mark - 导航栏按钮事件
- (void)rightItemAction:(UIButton *)sender{
      sender.selected=!sender.selected;
    if (sender.selected==YES&&_addView.alpha==0) {
        _addView.alpha=1;
    }else if (sender.selected==NO&&_addView.alpha==1){
        _addView.alpha=0;
    }
  
}

#pragma mark - collectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
        return 14+1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ListCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kListCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor whiteColor];
    if (indexPath.item==0) {
        
        cell.avartImgView.image=[UIImage imageNamed:@"通知2@"];
        cell.infoLabel.hidden=NO;
        cell.rightImgView.hidden=NO;
        cell.timeLabel.hidden=YES;
        cell.nickLabel.hidden=YES;
        cell.messageLabel.hidden=YES;
        
    }else{
        cell.infoLabel.hidden=YES;
        cell.rightImgView.hidden=YES;
        cell.timeLabel.hidden=NO;
        cell.nickLabel.hidden=NO;
        cell.messageLabel.hidden=NO;
        cell.model=nil;
    }
     return cell;
}

#pragma mark - TableView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item==0) {
        MessageInformViewController *messInformVC=[[MessageInformViewController alloc]init];
    
        [self.navigationController pushViewController:messInformVC animated:YES];
    }
}


@end

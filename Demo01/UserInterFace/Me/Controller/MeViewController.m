//
//  MeViewController.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "MeViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "MeListCollectionCell.h"
#import "MeTopView.h"

#import "LoginViewController.h"
#import "PersonInCenterViewController.h"
#import "UserEditingViewController.h"

#import "MyAttentionViewController.h"
#import "MyTagViewController.h"

#import "EditViewController.h"

#define kMeListCollectionViewCellIdentifier @"kMe_List_CollectionView_Cell_ID"
@interface MeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    MeTopView *_topView;
    
    NSArray *_imgArr;
    NSArray *_titleArr;
    
    UICollectionView *_listCollectionView;
}

@end

@implementation MeViewController

//个人中心
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    self.navigationController.navigationBarHidden=YES;
    [self requestData];
    
   // [self _createLoadedView];
    [self _createuUnloadView];
}

- (void)requestData{
    _imgArr=@[@"me关注2@",@"me粉丝2@",@"me标签2@",@"me下载2@",@"me收藏2@",@"me设置2@"];
    _titleArr=@[@"关注",@"粉丝",@"标签",@"下载",@"收藏",@"设置"];
    [_listCollectionView reloadData];
}

//已经登陆后的
- (void)_createLoadedView{
    _topView=[[[NSBundle mainBundle] loadNibNamed:@"MeTopView" owner:self options:nil] lastObject];
    // 移除多余的控件
    [_topView.backButton removeFromSuperview];
    [_topView.rightButton removeFromSuperview];
    [_topView.loadView removeFromSuperview];
    
    [_topView.editButton addTarget:self action:@selector(editButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_topView];
    
    //进入主页按钮
    UIButton *centerButton=[UIButton buttonWithType:UIButtonTypeCustom];
    centerButton.frame=CGRectMake(0, 0, kScreenWidth, _topView.height-50);
    [centerButton setBackgroundColor:[UIColor clearColor]];
    
    [centerButton addTarget:self action:@selector(centerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerButton];
    
    //个人中心的list
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=3;
    layout.minimumLineSpacing=3;
    layout.itemSize=CGSizeMake(kScreenWidth, 48);
    layout.sectionInset=UIEdgeInsetsMake(5, 0, 0, 0);
    CGRect frame=CGRectMake(0, _topView.bottom, kScreenWidth, kScreenHeight-kTabBarHeight-_topView.height);
    _listCollectionView=[[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    _listCollectionView.backgroundColor=[UIColor clearColor];
    _listCollectionView.delegate=self;
    _listCollectionView.dataSource=self;
    [_listCollectionView registerNib:[UINib nibWithNibName:@"MeListCollectionCell" bundle:nil] forCellWithReuseIdentifier:kMeListCollectionViewCellIdentifier];
    [self.view addSubview:_listCollectionView];
}

- (void)_createuUnloadView{
    //没有登陆的个人头部视图
    _topView=[[[NSBundle mainBundle] loadNibNamed:@"MeTopView" owner:self options:nil] lastObject];
    // 移除多余的控件
    [_topView.titleLabel removeFromSuperview];
    [_topView.backButton removeFromSuperview];
    [_topView.rightButton removeFromSuperview];
    [_topView.editButton removeFromSuperview];
    [_topView.markLabel removeFromSuperview];
    
    //登陆按钮
    [_topView.loadButton addTarget:self action:@selector(loadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_topView];
    
      //个人中心的list
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=3;
    layout.minimumLineSpacing=3;
    layout.itemSize=CGSizeMake(kScreenWidth, 48);
    layout.sectionInset=UIEdgeInsetsMake(5, 0, 0, 0);
    CGRect frame=CGRectMake(0, _topView.bottom, kScreenWidth, kScreenHeight-kTabBarHeight-_topView.height);
    _listCollectionView=[[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    _listCollectionView.backgroundColor=[UIColor clearColor];
    _listCollectionView.delegate=self;
    _listCollectionView.dataSource=self;
    [_listCollectionView registerNib:[UINib nibWithNibName:@"MeListCollectionCell" bundle:nil] forCellWithReuseIdentifier:kMeListCollectionViewCellIdentifier];
    [self.view addSubview:_listCollectionView];
}

#pragma mark - CollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section==0) {
        return 3;
    }else if (section==1){
        return 2;
    }else if (section==2){
        return 1;
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MeListCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kMeListCollectionViewCellIdentifier forIndexPath:indexPath];
    if (indexPath.section==0) {
        cell.imgView.image=[UIImage imageNamed:_imgArr[indexPath.row]];
        cell.nameLabel.text=_titleArr[indexPath.row];
    }else if (indexPath.section==1){
        cell.imgView.image=[UIImage imageNamed:_imgArr[indexPath.row+3]];
        cell.nameLabel.text=_titleArr[indexPath.row+3];
    }else if (indexPath.section==2){
        cell.imgView.image=[UIImage imageNamed:_imgArr[indexPath.row+5]];
        cell.nameLabel.text=_titleArr[indexPath.row+5];
    }
    return cell;
}

#pragma mark - CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.item==0) {
            //关注
            MyAttentionViewController *attVC=[[MyAttentionViewController alloc]init];
            attVC.title=@"我的关注";
            [self presentViewController:attVC animated:YES completion:nil];
        }else if (indexPath.item==1) {
            //粉丝
            MyAttentionViewController *attVC=[[MyAttentionViewController alloc]init];
            attVC.title=@"我的粉丝";
            [self presentViewController:attVC animated:YES completion:nil];
        }else if (indexPath.item==2){
            //标签
            MyTagViewController *tagVC=[[MyTagViewController alloc]init];
            tagVC.title=@"我的标签";
            [self presentViewController:tagVC animated:YES completion:nil];
        }
    }else if (indexPath.section==1){
        if (indexPath.item==0) {
            //下载
        }else if (indexPath.item==1) {
            //收藏
//            InformViewController *informVC=[[InformViewController alloc]init];
//            informVC.title=@"通知";
//            [self presentViewController:informVC animated:YES completion:nil];
        }
    }else{
        //设置
        EditViewController *editVC=[[EditViewController alloc]init];
//        UINavigationController *naviVC=[[UINavigationController alloc]initWithRootViewController:editVC];
        editVC.title=@"设置";
        [self presentViewController:editVC animated:YES completion:nil];
    }
}

#pragma mark - Button Action
- (void)editButtonAction:(UIButton *)sender{
    UserEditingViewController *userEditVC=[[UserEditingViewController alloc]init];
    [self presentViewController:userEditVC animated:YES completion:nil];
}

- (void)centerButtonAction:(UIButton *)sender{
    PersonInCenterViewController *personInCenterVC=[[PersonInCenterViewController alloc]init];
    [self presentViewController:personInCenterVC animated:NO completion:nil];
}

- (void)loadButtonAction:(UIButton *)sender{
    UIStoryboard *stb=[UIStoryboard storyboardWithName:@"Me" bundle:nil];
    LoginViewController *loginVC=[stb instantiateViewControllerWithIdentifier:@"LoginViewControllerID"];
    
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end

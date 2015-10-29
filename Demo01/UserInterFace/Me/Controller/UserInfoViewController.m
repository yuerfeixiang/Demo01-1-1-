//
//  UserInfoViewController.m
//  Demo01
//
//  Created by Deo on 15/10/21.
//  Copyright © 2015年 deo. All rights reserved.
//

#import "UserInfoViewController.h"

#import "Common.h"
#import "UIViewExt.h"

#import "MeEditListCollectionCell.h"
#import "MeTopView.h"

#define kEditListCollectionViewCellIdentifier @"kEdit_List_CollectionViewCell_ID"

@interface UserInfoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    MeTopView *_topView;
    NSArray *_imgArr;
    NSArray *_titleArr;
    NSArray *_infoArr;
    UICollectionView *_editListCollectionView;
}
@end

@implementation UserInfoViewController
//用户信息查看
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self requestData];
    [self _createTopView];
    [self _createSubViews];
}

- (void)requestData{
    _imgArr=@[@"昵称2@",@"签名2@",@"生日2@",@"性别2@",@"所在地2@",@"me兴趣2@"];
    _titleArr=@[@"昵称",@"签名",@"生日",@"性别",@"所在地",@"兴趣"];
    _infoArr=@[@"fanyiyi",@"I'm into anything artistic. i still watch dispay Channel.",@"10010808",@"女",@"所在地",@"兴趣"];
    [_editListCollectionView reloadData];
}
- (void)_createTopView{
    _topView=[[[NSBundle mainBundle] loadNibNamed:@"MeTopView" owner:self options:nil] lastObject];
    [self.view addSubview:_topView];
    // 移除多余的控件
    [_topView.userImgView removeFromSuperview];
    [_topView.avartImgView removeFromSuperview];
    [_topView.markLabel removeFromSuperview];
    [_topView.loadView removeFromSuperview];
    [_topView.rightButton removeFromSuperview];
    [_topView.editButton removeFromSuperview];
    _topView.titleLabel.text=@"资料详情";
    [_topView.backButton addTarget:self
                            action:@selector(backButtonAction:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    //用户头像
    UIImageView *downImgView=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-74)/2, _topView.bottom-37, 74, 74)];
    downImgView.image=[UIImage imageNamed:@"下面头像外边2@"];
    [_topView addSubview:downImgView];
    
    UIImageView *userImgView=[[UIImageView alloc]initWithFrame:CGRectMake(downImgView.left+2, downImgView.top+2, 70, 70)];
    userImgView.image=[UIImage imageNamed:@"头像2@"];
    userImgView.layer.cornerRadius=userImgView.height/2;
    userImgView.clipsToBounds=YES;
    [_topView addSubview:userImgView];
    
}

- (void)_createSubViews{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=3;
    layout.minimumLineSpacing=3;
    layout.itemSize=CGSizeMake(kScreenWidth, 48);
    layout.sectionInset=UIEdgeInsetsMake(5, 0, 0, 0);
    CGRect frame=CGRectMake(0, _topView.bottom+37, kScreenWidth, kScreenHeight-_topView.height-37);
    _editListCollectionView=[[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    _editListCollectionView.backgroundColor=[UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    _editListCollectionView.delegate=self;
    _editListCollectionView.dataSource=self;
    [_editListCollectionView registerNib:[UINib nibWithNibName:@"MeEditListCollectionCell" bundle:nil] forCellWithReuseIdentifier:kEditListCollectionViewCellIdentifier];
    [self.view addSubview:_editListCollectionView];
}

#pragma mark - CollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MeEditListCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kEditListCollectionViewCellIdentifier forIndexPath:indexPath];
    
    cell.imgView.image=[UIImage imageNamed:_imgArr[indexPath.item]];
    cell.nameLabel.text=_titleArr[indexPath.item];
    [cell.contentTextField removeFromSuperview];
    UILabel *infoLabel=[[UILabel alloc]initWithFrame:CGRectMake(cell.nameLabel.right+22, 5, kScreenWidth-cell.nameLabel.right-20, 38)];
    infoLabel.textColor=[UIColor colorWithRed:147/255.0 green:147/255.0 blue:147/255.0 alpha:1];
    infoLabel.font=[UIFont systemFontOfSize:15];
    if (indexPath.item==1) {
        infoLabel.numberOfLines=0;
    }
    infoLabel.text=_infoArr[indexPath.item];
    [cell.contentView addSubview:infoLabel];
    return cell;
}

- (void)backButtonAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

//
//  PhotoViewController.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIViewExt.h"
#import "Common.h"
#import "photoCollectionViewCell.h"

#import <AssetsLibrary/AssetsLibrary.h>


@interface PhotoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>
{
    UIView *topView;
    NSString * CELL_ID ;
    UIButton *topButton;
    UIControl *outsideControl;
    UIImageView *sprangView;
    UITableView *listTableView;
}
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CELL_ID = @"cell";
  

    [self setUpUI];

}
- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden: YES];
      self._dataArray = [NSMutableArray array];
    self._rollArray = [NSMutableArray array];
    [self getImgs];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden: NO];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)
    {
        ALAssetRepresentation *representation = [myasset defaultRepresentation];
        NSString *fileName = [representation filename];
        NSLog(@"fileName : %@",fileName);
    };
    
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init] ;
    [assetslibrary assetForURL:imageURL
                   resultBlock:resultblock
                  failureBlock:nil];
    
}
#pragma mark - 初始化collectionView

- (void)setUpUI
{
 
    topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    topView.backgroundColor  = HEXCOLOR(0x252932);
    //2f3a44
    [self.view addSubview:topView];
    topButton = [UIButton buttonWithType:UIButtonTypeCustom];
    topButton.frame = CGRectMake((self.view.frame.size.width-100)/2, 15, 100, 20);
    [topButton setTitle:@"全部" forState:UIControlStateNormal];
    topButton.titleLabel.textColor = HEXCOLOR(0xffffff);
    [topView addSubview:topButton];
    [topButton addTarget:self action:@selector(viewShow:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"相机确定2@"] forState:UIControlStateNormal];
    
//    [rightButton setBackgroundIm÷age:<#(nullable UIImage *)#> forState:<#(UIControlState)#>]
    rightButton.frame = CGRectMake(self.view.frame.size.width-64, (topView.height-27)/2, 54, 27);
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    rightButton.titleLabel.textColor = HEXCOLOR(0xffffff);
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [topView addSubview:rightButton];
    outsideControl = [[UIControl alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44)];
    outsideControl.backgroundColor = [UIColor clearColor];

    [outsideControl addTarget:self action:@selector(dismissTopView) forControlEvents:UIControlEventTouchUpInside];
    sprangView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-220)/2, 0, 220, 342)];
    
    [sprangView setImage:[UIImage imageNamed:@"相机浮窗2@"]];
    
    
    listTableView = [[UITableView alloc]initWithFrame:CGRectMake(sprangView.left, 10, sprangView.width, sprangView.height-10) style:UITableViewStylePlain];
    listTableView.backgroundColor = [UIColor clearColor];
    listTableView.delegate = self;
    listTableView.dataSource = self;
    listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing=1.5;
    layout.minimumLineSpacing=1.5;
    [layout setItemSize:CGSizeMake((self.view.frame.size.width-3)/3, (self.view.frame.size.width-3)/3)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.sectionInset = UIEdgeInsetsMake(0,0, 0, 0);
    self.photoVc = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44) collectionViewLayout:layout];
        self.photoVc.backgroundColor = HEXCOLOR(0x2f3a44);
    self.photoVc.delegate = self;
    self.photoVc.dataSource = self;
    [self.photoVc registerClass:[photoCollectionViewCell class] forCellWithReuseIdentifier:CELL_ID];
    [self.view addSubview:self.photoVc];
    [self.view addSubview:outsideControl];
    [outsideControl addSubview:sprangView];
    [outsideControl addSubview:listTableView];
    outsideControl.hidden = YES;
    sprangView.hidden = YES;
}
- (void)viewShow:(UIButton *)btn
{
    if (outsideControl.hidden == YES) {
        outsideControl.hidden = NO;
        sprangView.hidden = NO;
    }else
    {
        outsideControl.hidden = YES;
        sprangView.hidden = YES;
    }
    
}
- (void)dismissTopView
{
    outsideControl.hidden = YES;
    sprangView.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - tableView-dataSource,delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1.定义标识
    static NSString *ID = @"cell";
    // 2.去缓存区取出可循环使用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.创建可循环使用的cell
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(9,12, 40, 20)];
//    label.backgroundColor = [UIColor redColor];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:HEXCOLOR(0xffffff)];
    label.text = self._rollArray[indexPath.row];
    [label sizeToFit];
    
    [cell addSubview:label];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(9, 43.5, 202, 0.5)];
    lineView.backgroundColor = HEXCOLOR(0xffffff);
    [cell addSubview:lineView];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self._rollArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = [NSString stringWithFormat:@"%@",self._rollArray[indexPath.row]];
    [topButton setTitle:name forState:UIControlStateNormal];
    [self dismissTopView];
    [listTableView reloadData];
}
#pragma mark - collectionView-dataSource,delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self._dataArray.count+1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    photoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];
    cell.photoView.frame = CGRectMake(0, 0, (self.view.frame.size.width-3)/3, (self.view.frame.size.width-3)/3);
    if (indexPath.row == 0) {
        cell.photoView.backgroundColor = [UIColor redColor];
        cell.photoView.hidden = YES;
    }else
    {
        cell.photoView.hidden = NO;
        cell.photoView.backgroundColor = [UIColor greenColor];
        ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
        NSString *str = self._dataArray[self._dataArray.count-indexPath.row];
        NSURL *url=[NSURL URLWithString: str];
        [assetLibrary assetForURL:url resultBlock:^(ALAsset *asset)  {
            UIImage *image=[UIImage imageWithCGImage:asset.thumbnail];
            [cell.photoView setImage:image];
            
        }failureBlock:^(NSError *error) {
            NSLog(@"error=%@",error);
        }
         ];
    }
    
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSLog(@"拍照");
        
    }else
    {
        NSLog(@"图片");
        NSLog(@"%@",self._dataArray);
       
    }
}
#pragma mark - 获取系统相册中图片
-(void)getImgs{
    
    dispatch_async(dispatch_get_main_queue(), ^{

        
        
        ALAssetsLibraryAccessFailureBlock failureblock = ^(NSError *myerror){
            NSLog(@"相册访问失败 =%@", [myerror localizedDescription]);
            if ([myerror.localizedDescription rangeOfString:@"Global denied access"].location!=NSNotFound) {
                NSLog(@"无法访问相册.请在'设置->定位服务'设置为打开状态.");
            }else{
                NSLog(@"相册访问失败.");
            }
        };
        
        ALAssetsGroupEnumerationResultsBlock groupEnumerAtion = ^(ALAsset *result,NSUInteger index, BOOL *stop){
            if (result!=NULL) {
                
                if ([[result valueForProperty:ALAssetPropertyType]isEqualToString:ALAssetTypePhoto]) {
                    
                    NSString *urlstr=[NSString stringWithFormat:@"%@",result.defaultRepresentation.url];//图片的url
                    /*result.defaultRepresentation.fullScreenImage//图片的大图
                     result.thumbnail                            //图片的缩略图小图
                     //                    NSRange range1=[urlstr rangeOfString:@"id="];
                     //                    NSString *resultName=[urlstr substringFromIndex:range1.location+3];
                     //                    resultName=[resultName stringByReplacingOccurrencesOfString:@"&ext=" withString:@"."];//格式demo:123456.png
                     */
                    
                    [self._dataArray addObject:urlstr];
                }
            }
            
        };
        ALAssetsLibraryGroupsEnumerationResultsBlock
        libraryGroupsEnumeration = ^(ALAssetsGroup* group,BOOL* stop){
            
            if (group == nil)
            {
                
            }
            
            if (group!=nil) {
                NSString *g=[NSString stringWithFormat:@"%@",group];//获取相簿的组
                NSLog(@"gg:%@",g);//gg:ALAssetsGroup - Name:Camera Roll, Type:Saved Photos, Assets count:71
                [self.photoVc reloadData];
               
                NSString *g1=[g substringFromIndex:16 ] ;
                NSArray *arr=[NSArray arrayWithArray:[g1 componentsSeparatedByString:@","]];
                NSString *g2=[[arr objectAtIndex:0]substringFromIndex:5];
                if ([g2 isEqualToString:@"Camera Roll"]) {
//                    g2=@"相机胶卷";
                }
                [self._rollArray addObject:g2];
                 [listTableView reloadData];
                NSString *groupName=g2;//组的name
                NSLog(@"===================%@",g2);
                [group enumerateAssetsUsingBlock:groupEnumerAtion];
            }
            
        };
        
        ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
        [library enumerateGroupsWithTypes:ALAssetsGroupAll
                              usingBlock:libraryGroupsEnumeration
                            failureBlock:failureblock];

    });  
    
}

@end

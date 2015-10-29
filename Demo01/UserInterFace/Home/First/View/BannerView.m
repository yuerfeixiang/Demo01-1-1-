//
//  BannerView.m
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "Common.h"
#import "BannerView.h"

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        
        _count=0;
        
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        
    }
    
    return self;
}

- (void)_createBannerView{
    _scrollView=[[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.contentSize=CGSizeMake(kScreenWidth*6, 300);
    _scrollView.delegate=self;
    [self addSubview:_scrollView];
    
    for (int i=0; i<5; i++) {
        UIImageView *bannerImgView=[[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.bounds.size.height)];
        
        NSString *bannerImgName=_bannerImgArr[i];
        bannerImgView.image=[UIImage imageNamed:bannerImgName];
        [_scrollView addSubview:bannerImgView];
    }
    
    //多加一个图片
    UIImageView *bannerImgView=[[UIImageView alloc]initWithFrame:CGRectMake(5*kScreenWidth, 0, kScreenWidth, self.bounds.size.height)];
    
    NSString *bannerImgName=_bannerImgArr[0];
    bannerImgView.image=[UIImage imageNamed:bannerImgName];
    [_scrollView addSubview:bannerImgView];
    
    _scrollView.pagingEnabled=YES;
    _scrollView.contentOffset=CGPointMake(0, 0);
    _scrollView.showsHorizontalScrollIndicator=NO;//隐藏水平滚动条
    
    //黑色蒙板
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:self.bounds];
    imgView.image=[UIImage imageNamed:@"图片上的黑色蒙版2@"];
    imgView.alpha=0.5;
    [self addSubview:imgView];
    
    //分页
    _pageCtrl=[[UIPageControl alloc]initWithFrame:CGRectMake((kScreenWidth-100)/2, self.bounds.size.height-20, 100, 20)];
    _pageCtrl.numberOfPages=5;
    _pageCtrl.currentPage=_scrollView.contentOffset.x/kScreenWidth;
    [self addSubview:_pageCtrl];
    
}

- (void)setBannerImgArr:(NSArray *)bannerImgArr{
    _bannerImgArr=bannerImgArr;
    [self _createBannerView];
}

#pragma mark - TimerAction
- (void)timerAction:(NSTimer *)timer{
    if (_count>5) {
        _count=_count%5;
      
        _scrollView.contentOffset=CGPointMake(0, 0);
    }
    
    if (_count==5) {
        _pageCtrl.currentPage=0;
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        _scrollView.contentOffset=CGPointMake(_count*kScreenWidth, 0);
        
    }];
    _pageCtrl.currentPage=_scrollView.contentOffset.x/kScreenWidth;

    
    _count++;
    
}
#pragma mark - ScrollView Delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    NSInteger offsetX=scrollView.contentOffset.x;
    _count=offsetX/kScreenWidth+1;
    _count=_count%5;
    _pageCtrl.currentPage=offsetX/kScreenWidth;
    
    
}

@end

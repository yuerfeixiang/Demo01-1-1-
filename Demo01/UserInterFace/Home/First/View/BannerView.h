//
//  BannerView.h
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView : UIView<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIPageControl *_pageCtrl;
    
    int _count;
}
@property(nonatomic,strong)NSArray *bannerImgArr;

@end

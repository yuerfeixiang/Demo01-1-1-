//
//  ClassView.h
//  Demo01
//
//  Created by Deo on 15/10/10.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BannerView;
@interface ClassView : UIView<UITableViewDataSource,UITableViewDelegate>{
    BannerView *_bannerView;
    
    UITableView *_classTableView;
}

@end

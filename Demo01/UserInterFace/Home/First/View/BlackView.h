//
//  BlackView.h
//  Demo01
//
//  Created by Deo on 15/10/12.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlackView : UIView<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_choiceTableView;
}

@end

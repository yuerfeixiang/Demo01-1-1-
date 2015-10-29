//
//  AddView.h
//  Demo01
//
//  Created by Deo on 15/10/14.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddView : UIView<UITableViewDataSource,UITableViewDelegate>{
    NSArray *_imgArr;
    NSArray *_titArr;
}

@end

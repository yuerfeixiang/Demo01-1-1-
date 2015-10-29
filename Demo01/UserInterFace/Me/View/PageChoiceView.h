//
//  PageChoiceView.h
//  Demo01
//
//  Created by Deo on 15/10/19.
//  Copyright © 2015年 deo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangePageDelegate<NSObject>
@optional
    - (void)changePageWithIndex:(int)index;
    - (void)changeOtherPageWithIndex:(int)index;
@end

@interface PageChoiceView : UIView{
    NSArray *_titArr;
}

+ (instancetype)sharedInstance;

@property(nonatomic,assign)int selectedIndex;

@property(nonatomic,assign) id<ChangePageDelegate> delegate;

@end

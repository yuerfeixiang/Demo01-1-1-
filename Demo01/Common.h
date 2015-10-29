//
//  Common.h
//  Demo01
//
//  Created by 俞家模 on 15/10/9.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#ifndef Demo01_Common_h
#define Demo01_Common_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kTabBarHeight 49
#define kNavigationBarHeight 64

#define HEXCOLOR(c)    [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

#define TEXT_FONT(x)        [UIFont systemFontOfSize:x]

#import "UIViewExt.h"
#endif

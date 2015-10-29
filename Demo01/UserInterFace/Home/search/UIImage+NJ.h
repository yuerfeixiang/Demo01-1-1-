//
//  UIImage+NJ.h
//  9期微博
//
//  Created by teacher on 14-9-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (NJ)
/**
 *  根据传入的图片名称, 创建适配好iOS67之后的图片
 *
 *  @param imageNmae 图片名称
 *
 *  @return 适配iOS67之后的图片
 */
+ (instancetype)imageWithNmae:(NSString *)imageNmae;
/**
 *  获取拉伸不变形的图片
 *
 *  @param imageNmae 图片名称
 *
 *  @return 拉伸不变形的图片
 */
+ (instancetype)resizableImageWithName:(NSString *)imageNmae;

+ (instancetype)resizableImageWithName:(NSString *)imageNmae leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio;
@end

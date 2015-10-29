//
//  UIImage+NJ.m
//  9期微博
//
//  Created by teacher on 14-9-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+NJ.h"

@implementation UIImage (NJ)
+ (UIImage *)imageWithNmae:(NSString *)imageNmae
{
    // 1.定义返回结果
    UIImage *image = nil;
    // 2.判断当前系统版本
//    if (iOS8) {
//        // 2.1拼接图片名称
//        NSString *newImageName = [imageNmae stringByAppendingString:@"_os7"];
//        image = [UIImage imageNamed:newImageName];
//    }
    
#warning 不是所有的图片都有_os7结尾的图片
    if (image == nil) {
        image = [UIImage imageNamed:imageNmae];
    }
    // 4.返回图片
    return image;
    
}

+ (instancetype)resizableImageWithName:(NSString *)imageNmae
{
    return [self resizableImageWithName:imageNmae leftRatio:0.5 topRatio:0.5];
}

+ (instancetype)resizableImageWithName:(NSString *)imageNmae leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio
{
    // 1.创建图片
    UIImage *image = [UIImage imageWithNmae:imageNmae];
    CGSize imageSize = image.size;
    // 2.设置拉伸不变形
    image = [image stretchableImageWithLeftCapWidth:imageSize.width * leftRatio topCapHeight:imageSize.height * topRatio];
    // 3.返回图片
    return image;
}
@end

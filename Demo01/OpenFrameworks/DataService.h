//
//  DataService.h
//  WXWeibo
//
//  Created by Zheng on 15/9/2.
//  Copyright (c) 2015年 Qingwu Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

#define kWeiboBaseURL @"https://api.weibo.com/2/"

typedef void (^CompletionBlock)(id result);

@interface DataService : NSObject

/**
 *  自定义网络请求
 *
 *  @param urlStr     URL接口字符串
 *  @param params     请求参数
 *  @param httpMethod 请求方式
 *  @param block      请求成功之后的回调block
 */
+ (void)requestWithURL:(NSString *)urlStr
                params:(NSMutableDictionary *)params
            httpMethod:(NSString *)httpMethod
       completionBlock:(CompletionBlock)block;

/**
 *  AFNetworking请求数据
 *  @param urlString 接口地址(不完整)
 *  @param params    参数
 *  @param method    请求的方式
 *  @param block     回调block
 *  @param datas     要上传的数据,保存在数组中
 *
 *  @return session的datatask任务
 */
+ (NSURLSessionDataTask*)afRequestWithURL:(NSString*)urlString
                                   params:(NSMutableDictionary*)params
                                     data:(NSMutableDictionary*)datas
                               httpMethod:(NSString*)method
                               completion:(CompletionBlock)block;

@end

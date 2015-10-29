//
//  DataService.m
//  WXWeibo
//
//  Created by Zheng on 15/9/2.
//  Copyright (c) 2015年 Qingwu Zheng. All rights reserved.
//

#import "DataService.h"

@implementation DataService

+ (void)requestWithURL:(NSString *)urlStr
                params:(NSMutableDictionary *)params
            httpMethod:(NSString *)httpMethod
       completionBlock:(CompletionBlock)block {

  // 1.params参数
  if (params == nil) {
    params = [NSMutableDictionary dictionary];
  }

  // 2.参数中添加token
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSDictionary *sinaweiboInfo = [defaults objectForKey:@"SinaWeiboAuthData"];
  NSString *token = [sinaweiboInfo objectForKey:@"AccessTokenKey"];
  if (token == nil) {
    NSLog(@"Access_Token没有获取到");
    return;
  }
  [params setObject:token forKey:@"access_token"];
  /*
  [params setObject:<#(id)#> forKey:<#(id<NSCopying>)#>] //MutableDictionary
  [params setValue:<#(id)#> forKey:<#(NSString *)#>] //KVC
   */

  NSMutableURLRequest *request;
  //忽略大小写的比较
  //(1)GET请求
  NSComparisonResult result = [httpMethod caseInsensitiveCompare:@"get"];
  if (result == NSOrderedSame) {
    
    // 3.构造URL
    //@"https://api.weibo.com/2/statuses/home_timeline.json";
    //(1)前缀
    NSString *url = [kWeiboBaseURL stringByAppendingString:urlStr];
    
    NSMutableString *fullURLStr = [NSMutableString stringWithFormat:@"%@?", url];
    
    //(2)拼接参数
    //@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=...&id=...&text=mmm"
    
    //所有参数名
    NSArray *allKeys = [params allKeys];
    for (int i = 0; i < allKeys.count; i++) {
      //参数名key access_token
      NSString *key = allKeys[i];
      
      //参数值value 2.00vfytgyhujilhgjko
      NSString *value = [params objectForKey:key];
      
      // key=value
      NSString *keyvalue = [NSString stringWithFormat:@"%@=%@", key, value];
      
      // URL?key1=value1&key2=value2&...
      
      //[fullURL stringByAppendingString:<#(NSString *)#>]; //生成新的字符串，返回
      [fullURLStr appendString:keyvalue]; //追加在原来的字符串后面
      //添加连接符&
      if (i < allKeys.count - 1) {
        [fullURLStr appendString:@"&"];
      }
    }
    //完整的URL链接
    NSURL *fullURL = [NSURL URLWithString:fullURLStr];
    
    // 4.request
    request = [NSMutableURLRequest requestWithURL:fullURL];
    
    [request setHTTPMethod:@"GET"];
  }
  
  //(2)POST请求
  result = [httpMethod caseInsensitiveCompare:@"post"];
  if (result == NSOrderedSame) {
    
    // 3.构造URL
    //@"https://api.weibo.com/2/statuses/home_timeline.json";
    //(1)前缀
    NSString *url = [kWeiboBaseURL stringByAppendingString:urlStr];
    
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    //POST请求不需要参数拼接在URL后面
    
    //(2)参数添加在请求体中
    //@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=...&id=...&text=mmm"
    
    NSMutableString *bodyStr = [NSMutableString string];
    //所有参数名
    NSArray *allKeys = [params allKeys];
    for (int i = 0; i < allKeys.count; i++) {
      //参数名key access_token
      NSString *key = allKeys[i];
      
      //参数值value 2.00vfytgyhujilhgjko
      NSString *value = [params objectForKey:key];
      
      // key=value
      NSString *keyvalue = [NSString stringWithFormat:@"%@=%@", key, value];
      
      // URL?key1=value1&key2=value2&...
      
      //[fullURL stringByAppendingString:<#(NSString *)#>]; //生成新的字符串，返回
      [bodyStr appendString:keyvalue]; //追加在原来的字符串后面
      //添加连接符&
      if (i < allKeys.count - 1) {
        [bodyStr appendString:@"&"];
      }
    }
    
    [request setHTTPBody:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPMethod:@"POST"];
  }
  


  // 5.session
  NSURLSession *session = [NSURLSession sharedSession];

  // 6.task
  NSURLSessionDataTask *task =
      [session dataTaskWithRequest:request
                 completionHandler:^(NSData *data, NSURLResponse *response,
                                     NSError *error) {
                   if (error) {
                     NSLog(@"请求数据失败 : %@", error);
                     return;
                   }

                   //解析json数据
                   NSDictionary *jsonDic = [NSJSONSerialization
                       JSONObjectWithData:data
                                  options:NSJSONReadingMutableContainers
                                    error:nil];

                   //传递数据到外面
                   dispatch_async(dispatch_get_main_queue(), ^{
                     block(jsonDic);
                   });
                 }];

  // 7.发起网络请求
  [task resume];
}

+ (NSURLSessionDataTask*)afRequestWithURL:(NSString*)urlString
                                   params:(NSMutableDictionary*)params
                                     data:(NSMutableDictionary*)datas
                               httpMethod:(NSString*)method
                               completion:(CompletionBlock)block;
{
  //1.构造url(完整)
  //https://open.weibo.cn/2/ statuses/update.json
  NSString* fullURLString = [kWeiboBaseURL stringByAppendingString:urlString];
  //    NSURL* fullURL = [NSURL URLWithString:fullURLString];
  
  //2.拼接参数
  if (params == nil) {
    params = [NSMutableDictionary dictionary];
  }
  //access_token 保存 userDefaults
  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  NSDictionary* sinaweiboInfo = [defaults objectForKey:@"SinaWeiboAuthData"];
  NSString* accessToken = [sinaweiboInfo objectForKey:@"AccessTokenKey"];
  
  //把token添加到参数中
  [params setObject:accessToken forKey:@"access_token"];
  
  //3.AFSessionManager
  AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
  
  //4.序列化方式
  //序列化response
  manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
  
  NSURLSessionDataTask* task = nil;
  
  //5.发送请求
  if ([method isEqualToString:@"GET"]) {
    //GET请求, 设置参数
    task = [manager GET:fullURLString parameters:params success:^(NSURLSessionDataTask* task, id responseObject) {
      //拿到请求结果,回调
      dispatch_async(dispatch_get_main_queue(), ^{
        block(responseObject);
      });
    } failure:^(NSURLSessionDataTask* task, NSError* error) {
      ;
    }];
  }
  else if ([method isEqualToString:@"POST"]) {
    //POST请求
    if (datas == nil) {
      //没有请求体
      task = [manager POST:fullURLString parameters:params success:^(NSURLSessionDataTask* task, id responseObject) {
        //拿到请求结果,回调
        dispatch_async(dispatch_get_main_queue(), ^{
          block(responseObject);
        });
      } failure:^(NSURLSessionDataTask* task, NSError* error) {
        ;
      }];
    }
    else {
      //有要上传的数据(图片)
      task = [manager POST:fullURLString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        //datas key:data
        //构造请求体
        for (NSString *key in datas) {
          
          //要上传的每一条数据
          //key(key)=value(data)
          NSData *data = [datas objectForKey:key];
          
          //data: 要添加的数据
          //name: 数据对应的key
          //filename: 服务器可以接受的文件名
          //mimeType: 文件的类型
          [formData appendPartWithFileData:data
                                      name:key
                                  fileName:@"file"
                                  mimeType:@"image/jpeg"];
          
        }
        
      } success:^(NSURLSessionDataTask* task, id responseObject) {
        //拿到请求结果,回调
        dispatch_async(dispatch_get_main_queue(), ^{
          block(responseObject);
        });
      } failure:^(NSURLSessionDataTask* task, NSError* error) {
        ;
      }];
    }
  }
  
  return task;
}

@end

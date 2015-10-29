//
//  BaseModel.h
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject<NSCoding>

- (id)initWithDataDic:(NSDictionary *)data;
- (NSDictionary *)attributeMapDictionary;
- (void)setAttributes:(NSDictionary *)dataDic;
- (NSString *)customDescription;
- (NSString *)description;
- (NSData *)getArchivedData;

- (NSString *)cleanString:(NSString *)str; //清除\n和\r的字符串


@end

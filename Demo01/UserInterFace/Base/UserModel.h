//
//  UserModel.h
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "BaseModel.h"

@interface UserModel : BaseModel

@property(nonatomic,copy)NSString *area;
@property(nonatomic,strong)NSArray *avatars;
@property(nonatomic,strong)NSArray *dance;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSNumber *userID;
@property(nonatomic,copy)NSString *nick;
@property(nonatomic,copy)NSNumber *gender;

/*
 "user": {
 "area": "北京",
 "avatars": [],
 "dance": "[\"街舞\",\"民族舞\",\"现代舞\",\"古典舞\",\"芭蕾舞\"]",
 "description": "哈哈哈哈",
 "id": 37,
 "nick": "俞家模"
 
 gender:0,

 },
*/

@end

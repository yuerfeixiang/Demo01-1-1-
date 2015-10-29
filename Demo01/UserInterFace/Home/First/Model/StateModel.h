//
//  StateModel.h
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StateModel : NSObject

@property(nonatomic,copy)NSString *address;
@property(nonatomic,strong)NSData *createTime;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSNumber *stateID;
@property(nonatomic,copy)NSData *lastUpdate;
//@property(nonatomic,strong)NSString *latitude;//
//@property(nonatomic,copy)NSData *longitude;//
@property(nonatomic,copy)NSString *area;
@property(nonatomic,strong)NSArray *avatars;
@property(nonatomic,strong)NSArray *dance;
//@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSNumber *userID;
@property(nonatomic,copy)NSString *nick;
//@property(nonatomic,strong)NSArray *dance;



/* {
 "address": "北京市·新龙城(西北门)",
 "createTime": 1444660693208,
 "description": "哈哈哈哈哈哈哈哈哈哈",
 "id": 85,
 "lastUpdate": 1444660693208,
 "latitude": 40.069595,
 "longitude": 116.32154,
 "momentCatalogs": [
 {
 "id": 319,
 "momentContents": [
 {
 "file": {
 "id": 672,
 "path": "/VIDEO/2015/10/12/16b873672",
 "size": 789338,
 "type": "V",
 "videoInfo": {
 "duration": 10.705,
 "height": 480,
 "origin": "/VIDEO/2015/10/12/16b873672.m3u8",
 "thumbnail": "/VIDEO/2015/10/12/16b873672_onetrue.jpg",
 "width": 640
 }
 },
 "id": 719
 }
 ],
 "name": "图片目录"
 }
 ],
 "praiseCount": 1,
 "section": {
 "children": [],
 "id": 1,
 "name": "用户发布"
 },
 "tags": [
 {
 "name": "呵呵呵"
 }
 ],
 "type": 2,
 "user": {
 "area": "北京",
 "avatars": [],
 "dance": "[\"街舞\",\"民族舞\",\"现代舞\",\"古典舞\",\"芭蕾舞\"]",
 "description": "哈哈哈哈",
 "id": 37,
 "nick": "俞家模"
 },
 "viewingCount": 2
 },
*/

@end

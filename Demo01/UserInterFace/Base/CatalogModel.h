//
//  CatalogModel.h
//  Demo01
//
//  Created by Deo on 15/10/13.
//  Copyright (c) 2015年 deo. All rights reserved.
//

#import "BaseModel.h"

@class ContentModel;
@interface CatalogModel : BaseModel

@property(nonatomic,copy)NSNumber *catalogID;

@property(nonatomic,strong)ContentModel *contentModel;

@property(nonatomic,copy)NSString *name;

/*
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
 */

@end

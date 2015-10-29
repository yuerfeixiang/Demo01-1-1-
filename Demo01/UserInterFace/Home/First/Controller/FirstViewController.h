//
//  FirstViewController.h
//  
//
//  Created by 俞家模 on 15/10/9.
//
//


#import <UIKit/UIKit.h>
#import "HomeNaviView.h"
@class ClassView;
@class DanceView;
@class ProisView;
@interface FirstViewController : UIViewController<ChangeViewDelegate>

@property(nonatomic,retain)NSMutableArray *data;
@property(nonatomic,retain)ClassView *classView;
@property(nonatomic,retain)DanceView *danceView;
@property(nonatomic,retain)ProisView *proisView;


@end

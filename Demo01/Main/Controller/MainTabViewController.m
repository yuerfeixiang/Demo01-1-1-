//
//  MainTabViewController.m
//  
//
//  Created by 俞家模 on 15/10/9.
//
//

#import "MainTabViewController.h"

#import "Common.h"

@interface MainTabViewController ()

@end

@implementation MainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectedIndex=0;
  
    [self _createTabBarView];
    
    [self _createChildViewControllers];
}

- (void)_createTabBarView{
    //1.TabBar
    _tabView=[[UIImageView alloc]initWithFrame:CGRectMake(0, kScreenHeight-kTabBarHeight, kScreenWidth, kTabBarHeight)];
    _tabView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"底部背景2@"]];
    _tabView.userInteractionEnabled=YES;
    [self.view addSubview:_tabView];
    
    //2.Items
    NSArray *imgArr=@[@"home_black2@",@"discover_black2@",@"camera2@",@"message_black2@",@"me_black2@"];
    NSArray *imgSelArr=@[@"home_white2@",@"discover_white2@",@"camera2@",@"message_white2@",@"me_white2@"];
    
    CGFloat itemWidth=kScreenWidth/imgArr.count;
    
    for (int i=0; i<imgArr.count; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, 49, 49);
//        button.frame=CGRectMake(i*itemWidth, 0, itemWidth, kTabBarHeight);
        [button setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imgSelArr[i]] forState:UIControlStateSelected];
        button.center=CGPointMake(itemWidth/2+i*itemWidth, kTabBarHeight/2);
        button.tag=1000+i;
        if (i==0) {
            button.selected=YES;
        }
        
        [button addTarget:self action:@selector(selectedTabBarItem:) forControlEvents:UIControlEventTouchUpInside];
        [_tabView addSubview:button];
    }
}

- (void)_createChildViewControllers{
    NSArray *stbNames=@[@"First",@"Discover",@"Photo",@"Message",@"Me"];
    
    for (int i=0; i<stbNames.count; i++) {
        NSString *stbName=stbNames[i];
        
        UIStoryboard *storyboard=[UIStoryboard storyboardWithName:stbName bundle:nil];
        
        UIViewController *naVC=[storyboard instantiateInitialViewController];
        
        [self addChildViewController:naVC];
      
    }
    UIViewController *firstVC=[self.childViewControllers firstObject];

    [self.view insertSubview:firstVC.view belowSubview:_tabView];
}


#pragma mark - Button Action
- (void)selectedTabBarItem:(UIButton *)sender{
    
    self.selectedIndex=sender.tag-1000;
}
- (void)setSelectedIndex:(NSInteger)selectedIndex{
    
    if (_selectedIndex!=selectedIndex) {
        // 1.取之前的视图控制器
        UIViewController *prevVC = self.childViewControllers[_selectedIndex];
        
        UIButton *preButton=(UIButton *)[_tabView viewWithTag:_selectedIndex+1000];
        preButton.selected=!preButton.selected;
        
        UIButton *currentButton=(UIButton *)[_tabView viewWithTag:selectedIndex+1000];
        currentButton.selected=!currentButton.selected;

        // 2.当前选中的控制器
        UIViewController *currentVC = self.childViewControllers[selectedIndex];
        
        //双转场(可以移除之前的视图)
        [UIView transitionFromView:prevVC.view
                            toView:currentVC.view
                          duration:.35
                           options:UIViewAnimationOptionCurveLinear
                        completion:^(BOOL finished) {
                            [self.view bringSubviewToFront:_tabView];
                        }];
        
        _selectedIndex = selectedIndex;
    }

}

@end

//
//  MainViewController.m
//  WeiBoTabBarDemo
//  
//  Created by 谢小御 on 16/3/23.
//  Copyright © 2016年 谢小御. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "BaseViewController.h"
#import "XLTabBar.h"
@interface MainViewController ()<XLTabBarDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self addChildViewController:[[HomeViewController alloc] init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    [self addChildViewController:[[MessageViewController alloc] init] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [self addChildViewController:[[DiscoverViewController alloc] init] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [self addChildViewController:[[ProfileViewController alloc] init] title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    XLTabBar *tabBar = [[XLTabBar alloc] init];
    //设置代理
    tabBar.delegate = self;
    
    //修改tabBar为自定义tabbar
    //self.tabBar = tabBar; 如果系统的为readOnly,要修改属性,就用KVC,即setValue  forKey
    [self setValue:tabBar forKey:@"tabBar"];
    
    
}
/**
 *  添加子控制器
 *
 *  @param childController 子控制器
 *  @param title           标题
 *  @param image           图片
 *  @param selectedImage   选中后图片
 */
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    //设置子控制器的文字,(可以设置tabbar和navigationBar的文字)
    childController.title = title;
    //设置tabbarItem的图片
    childController.tabBarItem.image = [UIImage imageNamed:image];
    //禁止图片渲染
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置文字样式
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBColor(123, 123, 123)} forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    
    //卫子视图包装导航控制器
    BaseViewController *navigationVC = [[BaseViewController alloc] initWithRootViewController:childController];
    //添加子控制器
    [self addChildViewController:navigationVC];
}
- (void)setUpUnreadCount
{
    int count = 99;
    //设置提醒数字
    NSString *status = [NSString stringWithFormat:@"%d",count];
    if ([status isEqualToString:@"0"]) {
        self.tabBarItem.badgeValue = nil;
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    }else{//非0
        self.tabBarItem.badgeValue = status;
        [UIApplication sharedApplication].applicationIconBadgeNumber = status.intValue;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

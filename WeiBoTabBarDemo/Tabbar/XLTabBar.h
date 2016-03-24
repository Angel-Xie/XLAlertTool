//
//  XLTabBar.h
//  WeiBoTabBarDemo
//
//  Created by 谢小御 on 16/3/23.
//  Copyright © 2016年 谢小御. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLTabBar;
@protocol XLTabBarDelegate <UITabBarDelegate>

@optional
- (void)tabBarDidClickPlusButton:(XLTabBar *)tabBar;
@end
@interface XLTabBar : UITabBar
@property (weak, nonatomic)id<XLTabBarDelegate>delegate;
@end

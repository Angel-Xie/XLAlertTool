//
//  HomeViewController.m
//  WeiBoTabBarDemo
//  首页
//  Created by 谢小御 on 16/3/23.
//  Copyright © 2016年 谢小御. All rights reserved.
//

#import "HomeViewController.h"
#import "UIAlertTool.h"
@interface HomeViewController ()
@property (strong, nonatomic) UIAlertTool *alert;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(setUpUnreadCount) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (UIAlertTool *)alert
{
    if (_alert == nil) {
        _alert = [[UIAlertTool alloc] init];
    }
    return _alert;
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
- (IBAction)buttonDidClicked:(id)sender {
    [self.alert showAlertView:self withTitle:@"提示" withMessage:@"这是一个提示" withCancelButtonTitle:@"取消" withOtherButtontitle:@"确定" withConfirmBlock:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    } withCancelBlock:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

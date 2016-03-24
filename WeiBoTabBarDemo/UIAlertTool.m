//
//  UIAlertTool.m
//  WeiBoTabBarDemo
//
//  Created by 谢小御 on 16/3/23.
//  Copyright © 2016年 谢小御. All rights reserved.
//
#define IAIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#import "UIAlertTool.h"

typedef void(^confirm)();
typedef void(^cancle)();
@interface UIAlertTool ()
{
    confirm confirmParam;
    cancle cancleParam;
}
@end

@implementation UIAlertTool
- (void)showAlertView:(UIViewController *)viewController withTitle:(NSString *)title withMessage:(NSString *)message withCancelButtonTitle:(NSString *)cancelButtonTitle withOtherButtontitle:(NSString *)otherButtonTitle withConfirmBlock:(void(^)())confirm withCancelBlock:(void (^)())cancel
{
    confirmParam = confirm;
    cancleParam = cancel;
    if (IAIOS8) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        //创建Action
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancel();
        }];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            confirm();
        }];
        //add action
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        
        [viewController presentViewController:alertController animated:YES completion:nil];
    }else{
        UIAlertView *titleAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];
        [titleAlert show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        confirmParam();
    }
    else{
        cancleParam();
    }
}
@end

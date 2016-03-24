//
//  UIAlertTool.h
//  WeiBoTabBarDemo
//
//  Created by 谢小御 on 16/3/23.
//  Copyright © 2016年 谢小御. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAlertTool : NSObject
- (void)showAlertView:(UIViewController *)viewController withTitle:(NSString *)title withMessage:(NSString *)message withCancelButtonTitle:(NSString *)cancelButtonTitle withOtherButtontitle:(NSString *)otherButtonTitle withConfirmBlock:(void(^)())confirm withCancelBlock:(void (^)())cancel;
@end

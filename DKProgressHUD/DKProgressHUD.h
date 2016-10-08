//
//  DKProgressHUD.h
//  TestMBProgressHUD
//
//  Created by 庄槟豪 on 2016/10/8.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//  基于MBProgressHUD的二次开发,封装一层最常用的方法,模仿SV提供两套最常用的样式.

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, DKProgressHUDStyle) {
    DKProgressHUDStyleBlack,
    DKProgressHUDStyleLight
};

@interface DKProgressHUD : MBProgressHUD

#pragma mark - Customization

/** hud样式 */
+ (DKProgressHUDStyle)progressHUDStyle;

/** hud从显示到隐藏的间隔时间(秒) */
+ (CGFloat)progressHUDInterval;

#pragma mark - Show Methods

+ (instancetype)showLoading;
+ (instancetype)showLoadingToView:(UIView *)view;

+ (instancetype)showLoadingWithStatus:(NSString *)status;
+ (instancetype)showLoadingWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)showSuccessWithStatus:(NSString *)status;
+ (void)showSuccessWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)showErrorWithStatus:(NSString *)status;
+ (void)showErrorWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)showInfoWithStatus:(NSString *)status;
+ (void)showInfoWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)dismiss;
+ (void)dismissForView:(UIView *)view;

@end

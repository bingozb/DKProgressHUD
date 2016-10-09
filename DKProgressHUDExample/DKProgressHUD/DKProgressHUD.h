//
//  DKProgressHUD.h
//  DKProgressHUD
//
//  Created by 庄槟豪 on 2016/10/8.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//  基于MBProgressHUD的二次开发,封装最常用的方法,模仿SV提供两套最常用的样式.

#import "MBProgressHUD.h"
#import "DKProgressHUDConst.h"

typedef NS_ENUM(NSInteger, DKProgressHUDStyle) {
    DKProgressHUDStyleBlack,
    DKProgressHUDStyleLight
};

typedef NS_ENUM(NSInteger, DKProgressHUDMode) {
    DKProgressHUDModeDeterminateHorizontalBar = 2,  // 水平进度条
    DKProgressHUDModeAnnularDeterminate             // 圆环进度条
};

@interface DKProgressHUD : MBProgressHUD

#pragma mark - Customization

/** hud样式 */
+ (DKProgressHUDStyle)progressHUDStyle;

/** 进度条样式 */
+ (DKProgressHUDMode)progressHUDMode;

/** hud从显示到隐藏的间隔时间(秒) */
+ (CGFloat)progressHUDInterval;

/**
 *  是否启用遮罩蒙版 默认为NO
 *  如果返回YES, hud显示的时候禁止用户点击, 并且用户点击蒙版的时候会发出通知:DKProgressHUDDidClickedNotification
 */
+ (BOOL)useCoverMask;

#pragma mark - Show Methods

+ (instancetype)showLoading;
+ (instancetype)showLoadingToView:(UIView *)view;
+ (instancetype)showLoadingWithStatus:(NSString *)status;
+ (instancetype)showLoadingWithStatus:(NSString *)status toView:(UIView *)view;

+ (instancetype)showProgress;
+ (instancetype)showProgressToView:(UIView *)view;
+ (instancetype)showProgressWithStatus:(NSString *)status;
+ (instancetype)showProgressWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)showSuccessWithStatus:(NSString *)status;
+ (void)showSuccessWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)showErrorWithStatus:(NSString *)status;
+ (void)showErrorWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)showInfoWithStatus:(NSString *)status;
+ (void)showInfoWithStatus:(NSString *)status toView:(UIView *)view;

+ (void)dismiss;
+ (void)dismissForView:(UIView *)view;

@end

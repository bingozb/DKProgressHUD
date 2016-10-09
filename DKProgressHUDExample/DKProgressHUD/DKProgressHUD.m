//
//  DKProgressHUD.m
//  DKProgressHUD
//
//  Created by 庄槟豪 on 2016/10/8.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import "DKProgressHUD.h"

@implementation DKProgressHUD

NSString *const successImage = @"success.png";
NSString *const infoImage = @"info.png";
NSString *const errorImage = @"error.png";
NSString *const bundleName = @"DKProgressHUD.bundle";

#pragma mark - Customization

+ (DKProgressHUDStyle)progressHUDStyle
{
    return DKProgressHUDStyleBlack; // 默认黑色样式
}

+ (CGFloat)progressHUDInterval
{
    return 1.5;
}

#pragma mark - Getter && Setter

+ (UIColor *)tintColor
{
    if ([self progressHUDStyle] == DKProgressHUDStyleBlack) {
        return [UIColor whiteColor];
    }
    return [UIColor blackColor];
}

+ (UIColor *)backgroundColor
{
    if ([self progressHUDStyle] == DKProgressHUDStyleBlack) {
        return [UIColor blackColor];
    }
    return [UIColor whiteColor];
}

#pragma mark - Show Methods

+ (instancetype)showLoading
{
    return [self showLoadingToView:nil];
}

+ (instancetype)showLoadingToView:(UIView *)view
{
    view = view ? view : [[UIApplication sharedApplication].windows lastObject];
    
    DKProgressHUD *hud = [self showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [self backgroundColor];
    hud.bezelView.layer.backgroundColor = [[self backgroundColor] CGColor];
    hud.contentColor = [self tintColor];
    hud.userInteractionEnabled = NO;
    return hud;
}

+ (instancetype)showLoadingWithStatus:(NSString *)status
{
    return [self showLoadingWithStatus:status toView:nil];
}

+ (instancetype)showLoadingWithStatus:(NSString *)status toView:(UIView *)view
{
    DKProgressHUD *hud = [self showLoadingToView:view];
    hud.label.text = status;
    
    return hud;
}

+ (void)showSuccessWithStatus:(NSString *)status
{
    [self showSuccessWithStatus:status toView:nil];
}

+ (void)showSuccessWithStatus:(NSString *)status toView:(UIView *)view
{
    [self showStatus:status statusImage:successImage view:view];
}

+ (void)showErrorWithStatus:(NSString *)status
{
    [self showErrorWithStatus:status toView:nil];
}

+ (void)showErrorWithStatus:(NSString *)status toView:(UIView *)view
{
    [self showStatus:status statusImage:errorImage view:view];
}

+ (void)showInfoWithStatus:(NSString *)status
{
    return [self showInfoWithStatus:status toView:nil];
}

+ (void)showInfoWithStatus:(NSString *)status toView:(UIView *)view
{
    [self showStatus:status statusImage:infoImage view:view];
}

+ (void)dismiss
{
    [self dismissForView:nil];
}

+ (void)dismissForView:(UIView *)view
{
    view = view ? view : [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

#pragma mark - private method

+ (void)showStatus:(NSString *)status statusImage:(NSString *)statusImage view:(UIView *)view
{
    view = view ? view : [[UIApplication sharedApplication].windows lastObject];

    [self dismissForView:view];
    
    DKProgressHUD *hud = [self showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.userInteractionEnabled = NO;
    hud.bezelView.color = [self backgroundColor];
    hud.label.text = status;
    hud.contentColor = [self tintColor];
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *url = [bundle URLForResource:bundleName withExtension:nil];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    UIImage* statusImg = [UIImage imageWithContentsOfFile:[imageBundle pathForResource:statusImage ofType:nil]];
    if ([self progressHUDStyle] == DKProgressHUDStyleBlack) {
        statusImg = [statusImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    hud.customView = [[UIImageView alloc] initWithImage:statusImg];
    
    [hud hideAnimated:YES afterDelay:[self progressHUDInterval]];
}

@end

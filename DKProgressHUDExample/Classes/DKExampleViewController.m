//
//  DKExampleViewController.m
//  DKProgressHUDExample
//
//  Created by 庄槟豪 on 2016/10/8.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import "DKExampleViewController.h"

#import "DKProgressHUD.h"

@interface DKExampleViewController ()

@end

@implementation DKExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [DKProgressHUD showLoadingWithStatus:@"正在连接网络" toView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DKProgressHUD showErrorWithStatus:@"网络连接失败" toView:self.view];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DKProgressHUD showInfoWithStatus:@"网络连接正在恢复中" toView:self.view];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [DKProgressHUD showSuccessWithStatus:@"网络连接成功" toView:self.view];
                
            });
        });
    });
}

@end

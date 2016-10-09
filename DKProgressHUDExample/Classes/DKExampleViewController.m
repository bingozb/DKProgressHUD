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
@property (nonatomic, weak) DKProgressHUD *hud;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation DKExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testProgressHUD];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hudClick) name:DKProgressHUDDidClickedNotification object:nil];
}

- (void)testProgressHUD
{
    [DKProgressHUD showLoadingWithStatus:@"Loading" toView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DKProgressHUD showInfoWithStatus:@"Warning" toView:self.view];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [DKProgressHUD showSuccessWithStatus:@"Success" toView:self.view];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [DKProgressHUD showErrorWithStatus:@"ERROR" toView:self.view];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.hud = [DKProgressHUD showProgressWithStatus:@"Progress" toView:self.view];
                    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(testProgress) userInfo:nil repeats:YES];
                });
            });
        });
    });
}

- (void)testProgress
{
    _progress += 0.01;
    [self.hud setProgress:_progress];
    if (_progress >= 1) {
        _progress = 0;
        [self.timer invalidate];
        self.timer = nil;
        [self testProgressHUD];
    }
}

- (void)hudClick
{
    NSLog(@"HUD Did Cliked");
}

@end

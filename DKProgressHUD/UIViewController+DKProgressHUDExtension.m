//
//  UIViewController+DKProgressHUDExtension.m
//  DKProgressHUD
//
//  Created by 庄槟豪 on 2016/10/22.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import "UIViewController+DKProgressHUDExtension.h"
#import <objc/runtime.h>
#import "DKProgressHUD.h"

@implementation UIViewController (DKProgressHUDExtension)

+ (void)load
{
    Method willDisappearMethod = class_getInstanceMethod([self class], @selector(viewWillDisappear:));
    Method dkWillDisappearMethod = class_getInstanceMethod(self, @selector(dk_viewWillDisappear:));
    
    method_exchangeImplementations(willDisappearMethod, dkWillDisappearMethod);
}

- (void)dk_viewWillDisappear:(BOOL)animated
{
    [DKProgressHUD dismissForView:self.view];
    
    [self dk_viewWillDisappear:animated];
}


@end

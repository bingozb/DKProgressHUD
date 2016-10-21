//
//  DKCallbackMessage.m
//  DKProgressHUD
//
//  Created by 庄槟豪 on 2016/10/21.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import "DKCallbackMessage.h"

@implementation DKCallbackMessage

- (instancetype)initWithSuccessMessage:(NSString *)successMessage
{
    if (self = [super init]) {
        self.successMessage = successMessage;
    }
    return self;
}

- (instancetype)initWithInfoMessage:(NSString *)infoMessage
{
    if (self = [super init]) {
        self.infoMessage = infoMessage;
    }
    return self;
}

- (instancetype)initWithErrorMessage:(NSString *)errorMessage
{
    if (self = [super init]) {
        self.errorMessage = errorMessage;
    }
    return self;
}

+ (instancetype)callbackSuccessMessage:(NSString *)successMessage
{
    return [[self alloc] initWithSuccessMessage:successMessage];
}

+ (instancetype)callbackInfoMessage:(NSString *)infoMessage
{
    return [[self alloc] initWithInfoMessage:infoMessage];
}

+ (instancetype)callbackErrorMessage:(NSString *)errorMessage
{
    return [[self alloc] initWithErrorMessage:errorMessage];
}

@end
//
//  UIView+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2018/1/11.
//  Copyright © 2018年 Appfactory. All rights reserved.
//

#import "UIView+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation UIView(AFCrashExtension)

+ (void)becomeActive{
    
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(init) replaceMethodSel:@selector(lc_init)];
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(initWithFrame:) replaceMethodSel:@selector(lc_initWithFrame:)];
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(addSubview:) replaceMethodSel:@selector(lc_addSubview:)];
}

- (instancetype)lc_init
{
    if ([NSThread isMainThread])
    {
        return [self lc_init];
    }
    else
    {
        __block UIView * temp = nil;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            temp = [self lc_init];
        });
        
        return temp;
    }
}

- (instancetype)lc_initWithFrame:(CGRect)frame
{
    if ([NSThread isMainThread])
    {
        return [self lc_initWithFrame:frame];
    }
    else
    {
        __block UIView * temp = nil;
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            temp = [self lc_initWithFrame:frame];
        });
        
        return temp;
    }
}

- (void)lc_addSubview:(UIView *)view
{
    if ([NSThread isMainThread])
    {
        [self lc_addSubview:view];
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [self lc_addSubview:view];
        });
    }
}

@end

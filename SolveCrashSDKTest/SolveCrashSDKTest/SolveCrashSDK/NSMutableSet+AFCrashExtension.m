//
//  NSMutableSet+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSMutableSet+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSMutableSet (AFCrashExtension)

+ (void)becomeActive{
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSSetM") originMethodSel:@selector(addObject:) replaceMethodSel:@selector(lc_addObject:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSSetM") originMethodSel:@selector(removeObject:) replaceMethodSel:@selector(lc_removeObject:)];
}

- (void)lc_addObject:(id)anObject{
    if (anObject) {
        [self lc_addObject:anObject];
    }
}

- (void)lc_removeObject:(id)anObject{
    if (anObject) {
        [self lc_removeObject:anObject];
    }
}
@end

//
//  NSMutableDictionary+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSMutableDictionary+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSMutableDictionary (AFCrashExtension)

+ (void)becomeActive{
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSDictionaryM") originMethodSel:@selector(objectForKey:) replaceMethodSel:@selector(lc_objectForKey:)];
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSDictionaryM") originMethodSel:@selector(setObject:forKey:) replaceMethodSel:@selector(lc_setObject:forKey:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSDictionaryM") originMethodSel:@selector(removeObjectForKey:) replaceMethodSel:@selector(lc_removeObjectForKey:)];
}

- (void)lc_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject && aKey) {
        [self lc_setObject:anObject forKey:aKey];
    }
}

- (void)lc_removeObjectForKey:(id)aKey{
    if (aKey) {
        [self lc_removeObjectForKey:aKey];
    }
}

- (id)lc_objectForKey:(id)aKey
{
    id obj = [self lc_objectForKey:aKey];
    
    if (obj && [obj isKindOfClass:[NSNull class]]) {
        return nil;
    }
    else
    {
        return obj;
    }
    
    return obj;
}

@end

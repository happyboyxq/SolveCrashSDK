//
//  NSDictionary+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSDictionary+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSDictionary (AFCrashExtension)

+ (void)becomeActive{
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSDictionary0") originMethodSel:@selector(objectForKey:) replaceMethodSel:@selector(lc_objectForKey0:)];
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSDictionaryI") originMethodSel:@selector(objectForKey:) replaceMethodSel:@selector(lc_objectForKey1:)];
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSSingleEntryDictionaryI") originMethodSel:@selector(objectForKey:) replaceMethodSel:@selector(lc_objectForKeySingle:)];
    
    [SolveCrashHelp exchangeClassMethod:self originMethodSel:@selector(dictionaryWithObjects:forKeys:count:) replaceMethodSel:@selector(lc_dictionaryWithObjects:forKeys:count:)];
    
}

+ (instancetype)lc_dictionaryWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    
    id instance = nil;
    
    @try {
        instance = [self lc_dictionaryWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {

        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self lc_dictionaryWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}

- (id)lc_objectForKey0:(id)aKey
{
    return nil;
}

- (id)lc_objectForKey1:(id)aKey
{
    id obj = [self lc_objectForKey1:aKey];
    
    if (obj && [obj isKindOfClass:[NSNull class]]) {
        return nil;
    }
    else
    {
        return obj;
    }
    
    return obj;
}

- (id)lc_objectForKeySingle:(id)aKey
{
    id obj = [self lc_objectForKeySingle:aKey];
    
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

//
//  NSArray+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSArray+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSArray (AFCrashExtension)
+ (void)becomeActive{
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArray0") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(lc_objectAtIndex0:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(lc_objectAtIndexI:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(lc_objectSingleAtIndexSignle:)];
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSPlaceholderArray") originMethodSel:@selector(initWithObjects:count:) replaceMethodSel:@selector(lc_initWithObjects:count:)];
}

- (_Nullable instancetype)lc_initWithObjects:(const id  _Nonnull __unsafe_unretained *_Nullable)objects count:(NSUInteger)cnt
{
    id instance = nil;
    
    @try {
        instance = [self lc_initWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i]) {
                newObjects[index] = objects[i];
                index++;
            }
        }
        instance = [self lc_initWithObjects:newObjects count:index];
    }
    @finally {
        return instance;
    }
}

-(_Nullable id)lc_objectAtIndex0:(NSUInteger)index{
    return nil;
}

- (_Nullable id)lc_objectAtIndexI:(NSUInteger)index{
    
    id obj = nil;
    
    if (self.count > 0 && index < self.count) {
        obj = [self lc_objectAtIndexI:index];
    }
    
    return obj;
}

- (_Nullable id)lc_objectSingleAtIndexSignle:(NSUInteger)index{
    
    id obj = nil;
    
    if (self.count > 0 && index < self.count) {
        obj = [self lc_objectSingleAtIndexSignle:index];
    }
    
    return obj;
}

@end

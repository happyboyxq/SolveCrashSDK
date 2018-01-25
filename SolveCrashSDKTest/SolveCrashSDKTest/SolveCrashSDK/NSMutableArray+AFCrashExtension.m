//
//  NSMutableArray+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSMutableArray+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSMutableArray (AFCrashExtension)

+ (void)becomeActive{
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(lc_objectAtIndexM:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(addObject:) replaceMethodSel:@selector(lc_addObject:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(insertObject:atIndex:) replaceMethodSel:@selector(lc_insertObject:atIndex:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(removeObjectAtIndex:) replaceMethodSel:@selector(lc_removeObjectAtIndex:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(replaceObjectAtIndex: withObject:) replaceMethodSel:@selector(lc_replaceObjectAtIndex: withObject:)];
}

- (id)lc_objectAtIndexM:(NSUInteger)index{
    
    id obj = nil;
    
    if (self.count > 0 && index < self.count) {
        obj = [self lc_objectAtIndexM:index];
    }
    
    return obj;
}

- (void)lc_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject) {
        [self lc_insertObject:anObject atIndex:index];
    }
}

- (void)lc_addObject:(id)anObject{
    if (anObject) {
        [self lc_addObject:anObject];
    }
}

- (void)lc_removeObjectAtIndex:(NSUInteger)index{
    if (self.count > index) {
        [self lc_removeObjectAtIndex:index];
    }
}

- (void)lc_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (anObject && self.count > index) {
        [self lc_replaceObjectAtIndex:index withObject:anObject];
    }
}
@end

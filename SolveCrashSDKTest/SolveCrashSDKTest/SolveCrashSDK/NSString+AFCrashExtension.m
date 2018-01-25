//
//  NSString+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSString+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSString (AFCrashExtension)
+ (void)becomeActive{
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"NSPlaceholderString") originMethodSel:@selector(initWithString:) replaceMethodSel:@selector(lc_initWithString:)];
    
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSCFConstantString") originMethodSel:@selector(substringFromIndex:) replaceMethodSel:@selector(lc_cons_substringFromIndex:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSCFConstantString") originMethodSel:@selector(substringToIndex:) replaceMethodSel:@selector(lc_cons_substringToIndex:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSCFConstantString") originMethodSel:@selector(substringWithRange:) replaceMethodSel:@selector(lc_cons_substringWithRange:)];
    
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"NSTaggedPointerString") originMethodSel:@selector(substringFromIndex:) replaceMethodSel:@selector(lc_tag_substringFromIndex:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"NSTaggedPointerString") originMethodSel:@selector(substringToIndex:) replaceMethodSel:@selector(lc_tag_substringToIndex:)];
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"NSTaggedPointerString") originMethodSel:@selector(substringWithRange:) replaceMethodSel:@selector(lc_tag_substringWithRange:)];
    
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"__NSCFString") originMethodSel:@selector(substringWithRange:) replaceMethodSel:@selector(lc_cf_substringWithRange:)];
}

- (instancetype)lc_initWithString:(NSString *)aString;{
    if (aString) {
        return [self lc_initWithString:aString];
    }else{
        return [self lc_initWithString:@""];
    }
}

- (NSString *)lc_cons_substringFromIndex:(NSUInteger)from{
    if (from <= self.length) {
        return [self lc_cons_substringFromIndex:from];
    }else{
        return self;
    }
}

- (NSString *)lc_tag_substringFromIndex:(NSUInteger)from{
    if (from <= self.length) {
        return [self lc_tag_substringFromIndex:from];
    }else{
        return self;
    }
}

- (NSString *)lc_cons_substringToIndex:(NSUInteger)to{
    if (to <= self.length) {
        return [self lc_cons_substringToIndex:to];
    }else{
        return self;
    }
}

- (NSString *)lc_tag_substringToIndex:(NSUInteger)to{
    if (to <= self.length) {
        return [self lc_tag_substringToIndex:to];
    }else{
        return self;
    }
}


- (NSString *)lc_cons_substringWithRange:(NSRange)range{
    if (range.length <= self.length && (range.location + range.length <= self.length)) {
        return [self lc_cons_substringWithRange:range];
    }else{
        return self;
    }
}

- (NSString *)lc_tag_substringWithRange:(NSRange)range{
    if (range.length <= self.length && (range.location + range.length <= self.length)) {
        return [self lc_tag_substringWithRange:range];
    }else{
        return self;
    }
}

- (NSString *)lc_cf_substringWithRange:(NSRange)range{
    if (range.length <= self.length && (range.location + range.length <= self.length)) {
        return [self lc_cf_substringWithRange:range];
    }else{
        return self;
    }
}

@end

//
//  NSMutableAttributedString+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSMutableAttributedString+AFCrashExtension.h"
#import "SolveCrashHelp.h"

@implementation NSMutableAttributedString (AFCrashExtension)
+ (void)becomeActive{
    
    [SolveCrashHelp exchangeInstanceMethod:NSClassFromString(@"NSConcreteMutableAttributedString") originMethodSel:@selector(initWithString:) replaceMethodSel:@selector(lc_initWithString:)];
    
}


- (instancetype)lc_initWithString:(NSString *)aString;{
    if (aString) {
        return [self lc_initWithString:aString];
    }else{
        return [self lc_initWithString:@""];
    }
}


@end

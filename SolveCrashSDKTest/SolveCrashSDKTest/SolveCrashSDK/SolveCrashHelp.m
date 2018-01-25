//
//  SolveCrashHelp.m
//  jieke
//
//  Created by sky on 2017/8/29.
//  Copyright © 2017年 dqfeng. All rights reserved.
//

#import "SolveCrashHelp.h"
#import <objc/runtime.h>

@implementation SolveCrashHelp

+ (void)exchangeInstanceMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL{
    Method origIndex = class_getInstanceMethod(anClass, originSEL);
    Method overrideIndex = class_getInstanceMethod(anClass, replaceSEL);
    if (!origIndex || !overrideIndex) {
        return;
    }
    method_exchangeImplementations(origIndex, overrideIndex);
}

+ (void)exchangeClassMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL
{
    Method origIndex = class_getClassMethod(anClass, originSEL);
    Method overrideIndex = class_getClassMethod(anClass, replaceSEL);
    if (!origIndex || !overrideIndex) {
        return;
    }
    method_exchangeImplementations(origIndex, overrideIndex);
}
@end

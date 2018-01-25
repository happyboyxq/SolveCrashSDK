//
//  SolveCrashHelp.h
//  jieke
//
//  Created by sky on 2017/8/29.
//  Copyright © 2017年 dqfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolveCrashHelp : NSObject

+ (void)exchangeInstanceMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL;

+ (void)exchangeClassMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL;

@end

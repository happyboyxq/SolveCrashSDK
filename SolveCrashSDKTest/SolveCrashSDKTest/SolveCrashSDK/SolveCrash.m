//
//  SolveCrash.m
//  jieke
//
//  Created by sky on 2017/8/29.
//  Copyright © 2017年 dqfeng. All rights reserved.
//

#import "SolveCrash.h"
#import "NSArray+AFCrashExtension.m"
#import "NSDictionary+AFCrashExtension.h"
#import "NSMutableArray+AFCrashExtension.h"
#import "NSMutableDictionary+AFCrashExtension.h"
#import "NSMutableSet+AFCrashExtension.h"
#import "NSMutableAttributedString+AFCrashExtension.h"
#import "NSObject+AFCrashExtension.h"
#import "NSString+AFCrashExtension.h"
#import "UIView+AFCrashExtension.h"




@implementation SolveCrash

+ (SolveCrash *)sharedInstance
{
    static SolveCrash* b_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        b_instance = [[SolveCrash alloc] init];
    });
    return b_instance;
}

- (id)init{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)becomeActive
{
    [NSArray becomeActive];
    [NSDictionary becomeActive];
    [NSMutableArray becomeActive];
    [NSMutableDictionary becomeActive];
    [NSMutableSet becomeActive];
    [NSMutableAttributedString becomeActive];
    [NSObject becomeActive];
    [NSString becomeActive];
    [UIView becomeActive];
}

@end

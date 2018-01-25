//
//  NSObject+AFCrashExtension.m
//  SolveCrashSDK
//
//  Created by sky on 2017/5/25.
//  Copyright © 2017年 Appfactory. All rights reserved.
//

#import "NSObject+AFCrashExtension.h"
#import <objc/runtime.h>
#import "SolveCrashHelp.h"
#import "SC_CrashMethodProxy.h"

@implementation NSObject (AFCrashExtension)

+ (void)becomeActive{
    //KVO的重写
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(addObserver:forKeyPath:options:context:) replaceMethodSel:@selector(lc_addObserver:forKeyPath:options:context:)];
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(removeObserver:forKeyPath:) replaceMethodSel:@selector(lc_removeObserver:forKeyPath:)];
    
    
    //交换方法签名，用于解决doesNotRecognizeSelector的崩溃
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(methodSignatureForSelector:) replaceMethodSel:@selector(avoidCrashMethodSignatureForSelector:)];
    [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:@selector(forwardInvocation:) replaceMethodSel:@selector(avoidCrashforwardInvocation:)];
}

static char * s_mutableKVOObservings = "s_mutableKVOObservings";

- (NSMutableDictionary *)mutableKVOObservings {
    
     NSMutableDictionary * dic = (NSMutableDictionary *)objc_getAssociatedObject(self, s_mutableKVOObservings);
    
    if (dic == nil) {
        objc_setAssociatedObject(self, s_mutableKVOObservings, [NSMutableDictionary new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [SolveCrashHelp exchangeInstanceMethod:[self class] originMethodSel:NSSelectorFromString(@"dealloc") replaceMethodSel:@selector(lc_dealloc)];
    }
    
    return dic;
}

- (NSString *)identifierWithSelector:(id)object observer:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    return [NSString stringWithFormat:@"KeyValueSelectorOberving-%@:%@:object.%@",
            [NSValue valueWithPointer:(__bridge void *)object],
            [NSValue valueWithPointer:(__bridge void *)observer],
            keyPath];
}

- (BOOL)ma_isObserverExist:(NSObject *)observer target:(NSObject *)target forKeyPath:(NSString *)keyPath
{
    NSString * identifier = [self identifierWithSelector:target observer:observer forKeyPath:keyPath];
    
    NSMutableDictionary * dic = [self mutableKVOObservings];
    
    NSArray * array = [dic allKeys];
    
    return [array containsObject:identifier];
}

- (void)ma_addObserver:(NSObject *)observer target:(NSObject *)target forKeyPath:(NSString *)keyPath
{
    if (observer && target && keyPath) {
        NSString * identifier = [self identifierWithSelector:target observer:observer forKeyPath:keyPath];
        
        @synchronized(self)
        {
            NSDictionary * dic = @{@"observer":observer,@"target":target,@"keyPath":keyPath};
            [[self mutableKVOObservings] setObject:dic forKey:identifier];
        }
    }
}

- (BOOL)ma_removeObserver:(NSObject *)observer target:(NSObject *)target forKeyPath:(NSString *)keyPath
{
    if (observer && target && keyPath) {
        NSString * identifier = [self identifierWithSelector:target observer:observer forKeyPath:keyPath];
        
        NSMutableDictionary * dic = [self mutableKVOObservings];
        
        NSArray * array = [dic allKeys];
        
        if ([array containsObject:identifier]) {
            @synchronized(self)
            {
                [dic removeObjectForKey:identifier];
            }
            
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}


- (void) lc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
    if (observer && keyPath && ![self ma_isObserverExist:observer target:self forKeyPath:keyPath]) {
        @try {
            [self ma_addObserver:observer target:self forKeyPath:keyPath];
            [self lc_addObserver:observer forKeyPath:keyPath options:options context:context];
        }@catch (NSException *exception) {
        }
    }
}

- (void) lc_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    if (observer && keyPath && [self ma_isObserverExist:observer target:self forKeyPath:keyPath]) {
        @try {
            [self lc_removeObserver:observer forKeyPath:keyPath];
            [self ma_removeObserver:observer target:self forKeyPath:keyPath];
        }@catch (NSException *exception) {
        }
    }
}

- (void)lc_dealloc
{
    NSMutableDictionary * dic = [self mutableKVOObservings];
    if (dic.count > 0) {
        
        NSDictionary * tempdic = [dic copy];
        
        for (NSString * key in tempdic.allKeys) {
            NSDictionary * item = [dic objectForKey:key];
            NSObject * observer = [item objectForKey:@"observer"];
            NSString * keyPath = (NSString *)[item objectForKey:@"keyPath"];
            
            [self removeObserver:observer forKeyPath:keyPath];
        }
        
    }
    
    [self lc_dealloc];
    
}


//找不到方法的崩溃
static char * haveSuperNSMethodSignature = "lc_haveSuperNSMethodSignature";

- (NSMethodSignature *)avoidCrashMethodSignatureForSelector:(SEL)aSelector{

    NSMethodSignature * supermethodSignature = [self avoidCrashMethodSignatureForSelector:aSelector];

    if (supermethodSignature) {
        objc_setAssociatedObject(self, haveSuperNSMethodSignature, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return supermethodSignature;
    }
    else
    {
        NSMethodSignature *methodSignature = [SC_CrashMethodProxy instanceMethodSignatureForSelector:@selector(proxyMethod)];

        objc_setAssociatedObject(self, haveSuperNSMethodSignature, [NSNumber numberWithBool:NO], OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        if (methodSignature) {
            return methodSignature;
        }
        else
        {
            return nil;
        }
    }
}

- (void)avoidCrashforwardInvocation:(NSInvocation *)anInvocation {
    
    
    NSNumber * flag = (NSNumber *)objc_getAssociatedObject(self, haveSuperNSMethodSignature);

    if (flag.boolValue) {
        [self avoidCrashforwardInvocation:anInvocation];
    }
    else
    {
        //不做处理
        //NSLog(@"不做处理");
    }
    
}
@end

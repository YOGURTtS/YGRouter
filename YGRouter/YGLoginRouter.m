//
//  YGRouter.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGLoginRouter.h"

@implementation YGLoginRouter


+ (YGLoginRouter *)sharedInstance {
    static dispatch_once_t onceToken;
    static YGLoginRouter *instance;
    dispatch_once(&onceToken, ^{
        instance = [YGLoginRouter new];
    });
    return instance;
}

- (UIViewController *)viewControllerWithClassName:(NSString *)className {
    
    // 反射获取类
    Class clazz = NSClassFromString(className);
    
    // 未取到类或者不是UIViewController的类或子类，返空
    if (!clazz || [clazz isKindOfClass:[UIViewController class]]) {
        return nil;
    }
    
    // 获取viewController
    UIViewController *viewController = [clazz new];
    
    
    return viewController;
}

- (BOOL)canOpenURL:(NSURL *)URL {
    
}

- (UIViewController *)viewControllerWithURL:(NSURL *)URL {
    if ([URL isEqualToString:@""]) {
        
    }
}

- (UIViewController *)viewControllerWithURL:(NSURL *)URL parameters:(NSDictionary *)parameters {
    
}


- (UIViewController *)viewControllerWithClassName:(NSString *)className parameters:(NSDictionary *)parameters {
    
    // 反射获取类
    Class clazz = NSClassFromString(className);
    
    // 未取到类或者不是UIViewController的类或子类，返空
    if (!clazz || [clazz isKindOfClass:[UIViewController class]]) {
        return nil;
    }
    
    // 获取viewController
    UIViewController *viewController = [clazz new];
    
    // 如果parameters不为空
    if (parameters && parameters.allKeys.count) {
        SEL selector = NSSelectorFromString(@"initViewContrellerWithParameters:");
//        if (selector && [viewController respondsToSelector:selector]) {
//            [viewController performSelector:selector withObject:parameters];
//        }
        @try {
            [viewController performSelector:selector withObject:parameters];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception.description);
        } @finally {
            
        }
    }
    
    
    return viewController;
}

@end

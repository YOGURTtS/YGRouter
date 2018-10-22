//
//  YGRouteMediator.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGRouteMediator.h"

/** 用于存放routers */
static NSMutableDictionary *routersDict;

@implementation YGRouteMediator

- (BOOL)canOpenURL:(NSString *)URL {
    if (routersDict.allKeys.count == 0) {
        return NO;
    }
    [routersDict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<YGRoute>  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(canOpenURL:)]) {
            
        }
    }];
    
    return NO;
}

- (nullable UIViewController *)viewControllerWithURL:(nonnull NSString *)URL {
    return nil;
}

- (nullable UIViewController *)viewControllerWithURL:(nonnull NSString *)URL parameters:(nullable NSDictionary *)parameters {
    return nil;
}

@end

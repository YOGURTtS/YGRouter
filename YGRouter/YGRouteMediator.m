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

- (BOOL)canOpenURL:(NSURL *)URL {
    if (routersDict.allKeys.count == 0) {
        return NO;
    }
    __block BOOL canOpenURL = NO;
    [routersDict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<YGRoute>  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(canOpenURL:)]) {
            if ([obj canOpenURL:URL]) {
                canOpenURL = YES;
                *stop = YES;
            }
        }
    }];
    
    return canOpenURL;
}

- (nullable UIViewController *)viewControllerWithURL:(nonnull NSURL *)URL {
    return nil;
}

- (nullable UIViewController *)viewControllerWithURL:(nonnull NSURL *)URL parameters:(nullable NSDictionary *)parameters {
    return nil;
}

@end

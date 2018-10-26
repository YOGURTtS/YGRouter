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

+ (instancetype)sharedInstance {
    static YGRouteMediator *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YGRouteMediator new];
        routersDict = [NSMutableDictionary dictionary];
    });
    return instance;
}

- (void)registRouter:(id<YGRoute>)router withURL:(NSURL *)URL {
    if (![routersDict.allKeys containsObject:URL.host]) {
        [routersDict setObject:router forKey:URL.host];
    }
}

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
    if ([routersDict.allKeys containsObject:URL.host]) {
        id router = [routersDict objectForKey:URL.host];
        if ([router respondsToSelector:@selector(viewControllerWithURL:)]) {
            return [router viewControllerWithURL:URL];
        }
        return nil;
    }
    
    return nil;
}

- (nullable UIViewController *)viewControllerWithURL:(nonnull NSURL *)URL parameters:(nullable NSDictionary *)parameters {
    if ([routersDict.allKeys containsObject:URL.host]) {
        id router = [routersDict objectForKey:URL.host];
        if ([router respondsToSelector:@selector(viewControllerWithURL: parameters:)]) {
            return [router viewControllerWithURL:URL parameters:parameters];
        }
        return nil;
    }
    return nil;
}


@end

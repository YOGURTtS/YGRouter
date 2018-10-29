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

+ (id)sharedInstance {
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

- (void)pushToViewControllerWithURL:(NSURL *)URL fromViewController:(nullable UIViewController *)viewController {
    if ([routersDict.allKeys containsObject:URL.host]) {
        id router = [routersDict objectForKey:URL.host];
        if ([router respondsToSelector:@selector(pushToViewControllerWithURL:fromViewController:)]) {
            [router pushToViewControllerWithURL:URL fromViewController:viewController];
        }
    }
}

- (void)pushToViewControllerWithURL:(NSURL *)URL parameters:(NSDictionary *)parameters fromViewController:(nullable UIViewController *)viewController{
    if ([routersDict.allKeys containsObject:URL.host]) {
        id router = [routersDict objectForKey:URL.host];
        if ([router respondsToSelector:@selector(pushToViewControllerWithURL:parameters:fromViewController:)]) {
            [router pushToViewControllerWithURL:URL parameters:parameters fromViewController:viewController];
        }
    }
}


@end

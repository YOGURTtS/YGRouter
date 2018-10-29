//
//  YGRouteMediator.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGParentRouter.h"
#import "YGRouterModel.h"

/** 用于存放routers */
static NSMutableDictionary *routersDict;

@interface YGParentRouter ()

/** 路由模型 */
@property (nonatomic, strong) YGRouterModel *routerModel;

@end

@implementation YGParentRouter

+ (id)sharedInstance {
    static YGParentRouter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YGParentRouter new];
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

#pragma mark - 闭包

- (YGParentRouter *(^)(UIViewController *))from {
    return ^(UIViewController *fromViewController) {
        self.routerModel.from = fromViewController;
        return [YGParentRouter sharedInstance];
    };
}

- (YGParentRouter *(^)(NSString *))scheme {
    return ^(NSString *URLScheme) {
        self.routerModel.scheme = URLScheme;
        return [YGParentRouter sharedInstance];
    };
}

- (YGParentRouter *(^)(NSString *))host {
    return ^(NSString *URLHost) {
        self.routerModel.host = URLHost;
        return [YGParentRouter sharedInstance];
    };
}

- (YGParentRouter *(^)(NSString *))path {
    return ^(NSString *URLPath) {
        self.routerModel.path = URLPath;
        return [YGParentRouter sharedInstance];
    };
}

- (YGParentRouter *(^)(NSString *))query {
    return ^(NSString *URLQuery) {
        self.routerModel.query = URLQuery;
        return [YGParentRouter sharedInstance];
    };
}

- (YGParentRouter *(^)(NSDictionary *))params {
    return ^(NSDictionary *paramsDict) {
        self.routerModel.params = paramsDict;
        return [YGParentRouter sharedInstance];
    };
}

- (void)push {
    [self pushToViewControllerWithURL:[self.routerModel formatPropertiesToURL] parameters:self.routerModel.params fromViewController:self.routerModel.from];
}

#pragma mark - lazy load

- (YGRouterModel *)routerModel {
    if (!_routerModel) {
        _routerModel = [YGRouterModel new];
    }
    return _routerModel;
}


@end

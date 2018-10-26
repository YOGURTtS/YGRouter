//
//  YGRouter.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGLoginRouter.h"
#import "YGRouteMediator.h"

@interface YGLoginRouter ()

@property (nonatomic, strong) NSMapTable *viewControllerMap;

@end


@implementation YGLoginRouter

+ (void)load {
    [[YGRouteMediator sharedInstance] registRouter:[YGLoginRouter sharedInstance] withURL:[NSURL URLWithString:@"scheme://Login"]];
}


+ (YGLoginRouter *)sharedInstance {
    static dispatch_once_t onceToken;
    static YGLoginRouter *instance;
    dispatch_once(&onceToken, ^{
        instance = [YGLoginRouter new];
    });
    return instance;
}

- (void)registClass:(Class)cla withURL:(NSURL *)URL {
    NSString *classStr = NSStringFromClass(cla);
    if (![self.viewControllerMap.keyEnumerator.allObjects containsObject:[NSString stringWithFormat:@"%@%@", URL.host, URL.path]]) {
        [self.viewControllerMap setObject:classStr forKey:URL];
    }
}

- (BOOL)canOpenURL:(NSURL *)URL {
    NSURL *object;
    while (object = [self.viewControllerMap.keyEnumerator nextObject]) {
        if ([object.host isEqualToString:URL.host] && [object.path isEqualToString:URL.path]) {
            return YES;
        }
    }
    
    return NO;
}

- (UIViewController *)viewControllerWithURL:(NSURL *)URL {
    
    NSURL *object;
    while (object = [self.viewControllerMap.keyEnumerator nextObject]) {
        if ([object.host isEqualToString:URL.host] && [object.path isEqualToString:URL.path]) {
            
            NSString *classStr = [self.viewControllerMap objectForKey:[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@", URL.scheme, URL.host, URL.path]]];
            Class cla = NSClassFromString(classStr);
            UIViewController *viewController = [cla new];
            // 有参数就传值
            if (URL.query.length) {
                if ([viewController respondsToSelector:@selector(initViewContrellerWithParameters:)]) {
                    [viewController performSelector:@selector(initViewContrellerWithParameters:) withObject:[self dictionaryFromQuery:URL.query]];
                }
            }
            
            return viewController;
        }
    }
    
    return nil;
}

/** URL中的query转字典 */
- (NSDictionary *)dictionaryFromQuery:(NSString *)query {
    NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
    NSMutableDictionary *pairs = [NSMutableDictionary dictionary];
    NSScanner *scanner = [[NSScanner alloc] initWithString:query];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString *key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
            NSString *value = [[kvPair objectAtIndex:1] stringByRemovingPercentEncoding];
            [pairs setObject:value forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:pairs];
}


- (UIViewController *)viewControllerWithURL:(NSURL *)URL parameters:(NSDictionary *)parameters {
    
    NSURL *object;
    while (object = [self.viewControllerMap.keyEnumerator nextObject]) {
        if ([object.host isEqualToString:URL.host] && [object.path isEqualToString:URL.path]) {
            
            NSString *classStr = [self.viewControllerMap objectForKey:[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@", URL.scheme, URL.host, URL.path]]];
            Class cla = NSClassFromString(classStr);
            UIViewController *viewController = [cla new];
            // 有参数就传值
            NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
            if (URL.query.length) {
                [paramDict setValuesForKeysWithDictionary:[self dictionaryFromQuery:URL.query]];
            }
            if (parameters.allKeys.count) {
                [paramDict setValuesForKeysWithDictionary:parameters];
            }
            if ([viewController respondsToSelector:@selector(initViewContrellerWithParameters:)]) {
                [viewController performSelector:@selector(initViewContrellerWithParameters:) withObject:paramDict];
            }
            
            return viewController;
        }
    }
    
    return nil;
}


#pragma mark - lazy load

- (NSMapTable *)viewControllerMap {
    if (!_viewControllerMap) {
        _viewControllerMap = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsCopyIn valueOptions:NSPointerFunctionsStrongMemory];
    }
    return _viewControllerMap;
}

@end

//
//  YGRouter.m
//  YGRouter
//
//  Created by yogurts on 2018/10/26.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGRouter.h"
#import <objc/runtime.h>

@implementation YGRouter


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

- (void)pushToViewControllerWithURL:(NSURL *)URL fromViewController:(nullable UIViewController *)viewController{
    
    NSURL *object;
    while (object = [self.viewControllerMap.keyEnumerator nextObject]) {
        if ([object.host isEqualToString:URL.host] && [object.path isEqualToString:URL.path]) {
            
            NSString *classStr = [self.viewControllerMap objectForKey:[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@", URL.scheme, URL.host, URL.path]]];
            Class cla = NSClassFromString(classStr);
            UIViewController *destinationViewController = [cla new];
            // 有参数就传值
            if (URL.query.length) {
                if ([destinationViewController respondsToSelector:@selector(initViewContrellerWithParameters:)]) {
                    [destinationViewController performSelector:@selector(initViewContrellerWithParameters:) withObject:[self dictionaryFromQuery:URL.query]];
                }
            }
            
            destinationViewController.hidesBottomBarWhenPushed = YES;
            if (!viewController) {
                [[self currentNavigationController] pushViewController:destinationViewController animated:YES];
            } else {
                [viewController.navigationController pushViewController:destinationViewController animated:YES];
            }
        }
    }
    
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


- (void)pushToViewControllerWithURL:(NSURL *)URL parameters:(NSDictionary *)parameters fromViewController:(nullable UIViewController *)viewController{
    
    NSURL *object;
    while (object = [self.viewControllerMap.keyEnumerator nextObject]) {
        if ([object.host isEqualToString:URL.host] && [object.path isEqualToString:URL.path]) {
            
            NSString *classStr = [self.viewControllerMap objectForKey:[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@", URL.scheme, URL.host, URL.path]]];
            Class cla = NSClassFromString(classStr);
            UIViewController *destinationViewController = [cla new];
            // 有参数就传值
            NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
            if (URL.query.length) {
                [paramDict setValuesForKeysWithDictionary:[self dictionaryFromQuery:URL.query]];
            }
            if (parameters.allKeys.count) {
                [paramDict setValuesForKeysWithDictionary:parameters];
            }
            if ([destinationViewController respondsToSelector:@selector(initViewContrellerWithParameters:)]) {
                [destinationViewController performSelector:@selector(initViewContrellerWithParameters:) withObject:paramDict];
            }
            
            destinationViewController.hidesBottomBarWhenPushed = YES;
            if (!viewController) {
                [[self currentNavigationController] pushViewController:destinationViewController animated:YES];
            } else {
                [viewController.navigationController pushViewController:destinationViewController animated:YES];
            }
        }
    }
    
}

#pragma mark - 获取当前UINavigationController

- (UINavigationController *)currentNavigationController {
    id<UIApplicationDelegate>  dele = [UIApplication sharedApplication].delegate;
    UIViewController * vc = findBestNav(dele.window.rootViewController);
    NSAssert(vc && [vc isKindOfClass:[UINavigationController class]], @"未找到Nav: %@", vc);
    return (UINavigationController *)vc;
}

UIViewController * findBestNav(UIViewController * vc) {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        if (vc.presentedViewController && [vc.presentedViewController isKindOfClass:[UINavigationController class]]) {
            return findBestNav(vc.presentedViewController);
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController *sp = (UISplitViewController *)vc;
        return sp.viewControllers.count > 0 ? findBestNav(sp.viewControllers.lastObject) : nil;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *ta = (UITabBarController *)vc;
        return ta.viewControllers.count > 0 ? findBestNav(ta.selectedViewController) : nil;
    }
    return vc.navigationController;
}


#pragma mark - lazy load

- (NSMapTable *)viewControllerMap {
    if (!_viewControllerMap) {
        _viewControllerMap = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsCopyIn valueOptions:NSPointerFunctionsStrongMemory];
    }
    return _viewControllerMap;
}

@end

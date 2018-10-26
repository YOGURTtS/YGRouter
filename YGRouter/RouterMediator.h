//
//  RouterMediator.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//
//  路由中介者，使用代理实现
//

#import <UIKit/UIKit.h>

@protocol YGRoute <NSObject>

/** return BOOL value if router can open the URL */
- (BOOL)canOpenURL:(nonnull NSURL *)URL;

/** return ViewController without parameter */
- (nullable UIViewController *)viewControllerWithURL:(nonnull NSURL *)URL;

/** return ViewController with parameters */
- (nullable UIViewController *)viewControllerWithURL:(nonnull NSURL *)URL parameters:(nullable NSDictionary *)parameters;

@end

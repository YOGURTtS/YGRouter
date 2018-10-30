//
//  RouterMediator.h
//  YGModuleRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//
//  路由协议
//

#import <UIKit/UIKit.h>

@protocol YGRoute <NSObject>

/** singleton */
+ (id)sharedInstance;

/** return BOOL value if router can open the URL */
- (BOOL)canOpenURL:(nonnull NSURL *)URL;

/** return ViewController without parameter */
- (void)pushToViewControllerWithURL:(nonnull NSURL *)URL fromViewController:(nullable UIViewController *)viewController;

/** return ViewController with parameters */
- (void)pushToViewControllerWithURL:(nonnull NSURL *)URL parameters:(nullable NSDictionary *)parameters fromViewController:(nullable UIViewController *)viewController;

@end

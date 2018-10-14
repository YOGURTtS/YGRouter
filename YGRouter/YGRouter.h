//
//  YGRouter.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGRouter : NSObject

/** shared instance */
+ (YGRouter *)sharedInstance;

/** return ViewController without parameter */
- (UIViewController *)viewControllerWithClassName:(NSString *)className;

/** return ViewController with parameters */
- (UIViewController *)viewControllerWithClassName:(NSString *)className parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END

//
//  YGRouteMediator.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "RouterMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGRouteMediator : NSObject <YGRoute>

+ (instancetype)sharedInstance;

/** register ViewController's class */
- (void)registRouter:(id<YGRoute>)router withURL:(NSURL *)URL;

@end

NS_ASSUME_NONNULL_END

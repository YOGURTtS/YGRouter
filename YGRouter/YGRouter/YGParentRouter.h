//
//  YGRouteMediator.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "RouterMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGParentRouter : NSObject <YGRoute>


/** register ViewController's class */
- (void)registRouter:(id<YGRoute>)router withURL:(NSURL *)URL;

/** 从哪个控制器跳转 */
- (YGParentRouter * (^)(UIViewController *))from;
/** 协议 */
- (YGParentRouter * (^)(NSString *))scheme;
/** host */
- (YGParentRouter * (^)(NSString *))host;
/** 路径 */
- (YGParentRouter * (^)(NSString *))path;
/** query参数字符串,形如key=value */
- (YGParentRouter * (^)(NSString *))query;
/** 参数字典 */
- (YGParentRouter * (^)(NSDictionary *))params;
/** 拼接在链式调用最后，用于页面跳转 */
- (void)push;

@end

NS_ASSUME_NONNULL_END

//
//  YGRouteMediator.h
//  YGModuleRouter
//
//  Created by 孙星 on 2018/10/21.
//  Copyright © 2018 YOGURTS. All rights reserved.
//
//  中心路由，中介者，路由调度中心
//

#import "RouterMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGCentralRouter : NSObject <YGRoute>


/** register ViewController's class */
- (void)registRouter:(id<YGRoute>)router withURL:(NSURL *)URL;

/** 从哪个控制器跳转 */
- (YGCentralRouter * (^)(UIViewController *))from;
/** 协议 */
- (YGCentralRouter * (^)(NSString *))scheme;
/** host */
- (YGCentralRouter * (^)(NSString *))host;
/** 路径 */
- (YGCentralRouter * (^)(NSString *))path;
/** query参数字符串,形如key=value */
- (YGCentralRouter * (^)(NSString *))query;
/** 参数字典 */
- (YGCentralRouter * (^)(NSDictionary *))params;
/** 拼接在链式调用最后，用于页面跳转 */
- (void)push;

@end

NS_ASSUME_NONNULL_END

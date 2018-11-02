//
//  YGModuleRouterModel.h
//  YGModuleRouter
//
//  Created by yogurts on 2018/10/29.
//  Copyright © 2018 YOGURTS. All rights reserved.
//
//  路由模型，包括URL和参数
//

#import <UIKit/UIKit.h>

@interface YGRouterModel : NSObject

/** 从哪个控制器跳转 */
@property (nonatomic, strong) UIViewController *from;
/** 协议 */
@property (nonatomic, copy) NSString *scheme;
/** 主机 */
@property (nonatomic, copy) NSString *host;
/** 路径 */
@property (nonatomic, copy) NSString *path;
/** query参数字符串,形如key=value */
@property (nonatomic, copy) NSString *query;
/** 参数字典 */
@property (nonatomic, strong) NSMutableDictionary *params;

/** 将URL相关组成拼接成URL */
- (NSURL *)formatPropertiesToURL;

@end

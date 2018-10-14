//
//  NSObject+YGPassValue.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/14.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YGPassValue <NSObject>

/** 组件化传值代理 */
- (void)initViewContrellerWithParameters:(NSDictionary *)parameters;

@end


//
//  ProtocolMediator.h
//  YGModuleRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//
//  组件间提供服务的协议，用于组件间通信
//

#import <UIKit/UIKit.h>

@protocol YGSevice <NSObject>

/** singleton */
+ (id)sharedInstance;

/** return the class that obey the protocol */
- (id)seviceWithProtocol:(Protocol *)protocol;

@end

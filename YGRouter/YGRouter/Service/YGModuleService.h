//
//  YGModuleService.h
//  YGRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGCentralService.h"

@interface YGModuleService : NSObject <YGService>

- (void)registClass:(Class)cla withProtocol:(Protocol *)protocol;

@end

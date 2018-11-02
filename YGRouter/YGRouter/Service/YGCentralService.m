//
//  YGParentSevice.m
//  YGRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGCentralService.h"

static NSMutableArray *sevices;

@implementation YGCentralService

+ (id)sharedInstance {
    static YGCentralService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YGCentralService new];
        sevices = [NSMutableArray array];
    });
    return instance;
}

- (void)registModuleService:(id<YGService>)service {
    if (![sevices containsObject:service]) {
        [sevices addObject:service];
    }
}

- (Class)classWithProtocol:(Protocol *)protocol {
    for (id<YGService> service in sevices) {
        id object;
        if ((object = [service classWithProtocol:protocol])) {
            return object;
        }
    }
    
    return nil;
}


@end

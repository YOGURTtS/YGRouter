//
//  YGModuleService.m
//  YGRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGModuleService.h"
#import <objc/runtime.h>

@interface YGModuleService ()

/** 保存遵守protocol的类名 */
@property (nonatomic, strong) NSMutableDictionary<NSString*, NSString*> *classes;

@end

@implementation YGModuleService

+ (id)sharedInstance {
    Class selfClass = [self class];
    id instance = objc_getAssociatedObject(selfClass, @"kSharedInstance");
    if (!instance) {
        instance = [[selfClass alloc] init];
        objc_setAssociatedObject(selfClass, @"kSharedInstance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

- (void)registClass:(Class)cla withProtocol:(Protocol *)protocol {
    if (![self.classes.allKeys containsObject:NSStringFromProtocol(protocol)]) {
        [self.classes setObject:NSStringFromClass(cla) forKey:NSStringFromProtocol(protocol)];
    }
}


- (Class)classWithProtocol:(Protocol *)protocol {
    for (NSString *protocolName in self.classes.allKeys) {
        if ([protocolName isEqualToString:NSStringFromProtocol(protocol)]) {
            NSString *className = [self.classes objectForKey:protocolName];
            return NSClassFromString(className);
        }
    }
    
    return nil;
}

#pragma mark - lazy load
- (NSMutableDictionary *)classes {
    if (!_classes) {
        _classes = [NSMutableDictionary dictionary];
    }
    return _classes;
}

@end

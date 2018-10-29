//
//  NSObject+YGSharedInstance.m
//  YGRouter
//
//  Created by yogurts on 2018/10/26.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "NSObject+YGSharedInstance.h"
#import <objc/runtime.h>

@implementation NSObject (YGSharedInstance)

+ (id)sharedInstance {
    Class selfClass = [self class];
    NSLog(@"%@", NSStringFromClass(selfClass));
    id instance = objc_getAssociatedObject(selfClass, @"kSharedInstance");
    if (!instance) {
        instance = [[selfClass alloc] init];
        objc_setAssociatedObject(selfClass, @"kSharedInstance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

@end

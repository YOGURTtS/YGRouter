//
//  YGParentSevice.m
//  YGRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGCentralSevice.h"

@implementation YGCentralSevice

+ (id)sharedInstance {
    static YGCentralSevice *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YGCentralSevice new];
    });
    return instance;
}

- (void)registProtocol:(Protocol *)protocol withClass:(Class)cla {
    <#code#>
}


- (id)seviceWithProtocol:(Protocol *)protocol {
    <#code#>
}


@end

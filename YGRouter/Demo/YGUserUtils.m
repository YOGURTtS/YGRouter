//
//  YGUserUtils.m
//  YGRouter
//
//  Created by yogurts on 2018/11/2.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGUserUtils.h"
#import "YGLoginService.h"

@implementation YGUserUtils

+ (void)load {
    [[YGLoginService sharedInstance] registClass:[YGUserUtils class] withProtocol:@protocol(YGUserID)];
}

- (NSString *)userId {
    return @"123";
}

@end

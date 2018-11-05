//
//  YGLoginService.m
//  YGRouter
//
//  Created by yogurts on 2018/11/2.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGLoginService.h"

@implementation YGLoginService

+ (void)load {
    [[YGCentralService sharedInstance] registModuleService:[YGLoginService sharedInstance]];
}

@end

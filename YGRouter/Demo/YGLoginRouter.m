//
//  YGModuleRouter.m
//  YGModuleRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGLoginRouter.h"
#import "YGCentralRouter.h"

@implementation YGLoginRouter

+ (void)load {
        
    [[YGCentralRouter sharedInstance] registRouter:[YGLoginRouter sharedInstance] withURL:[NSURL URLWithString:@"scheme://Login"]];
}




@end

//
//  YGModuleRouterModel.m
//  YGModuleRouter
//
//  Created by yogurts on 2018/10/29.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGRouterModel.h"

@implementation YGRouterModel

- (NSURL *)formatPropertiesToURL {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@/%@?%@", self.scheme, self.host, self.path, self.query]];
}

@end

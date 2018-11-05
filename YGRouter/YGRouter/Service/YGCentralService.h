//
//  YGParentSevice.h
//  YGRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "ServiceMediator.h"

@interface YGCentralService : NSObject <YGService>

/** register module sevice */
- (void)registModuleService:(id<YGService>)sevice;

@end

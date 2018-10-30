//
//  YGModuleRouter.h
//  YGModuleRouter
//
//  Created by yogurts on 2018/10/26.
//  Copyright © 2018 YOGURTS. All rights reserved.
//
//
//

#import "YGCentralRouter.h"
#import "YGPassValue.h"

@interface YGModuleRouter : NSObject <YGRoute>

/** register ViewController's class */
- (void)registClass:(Class)cla withURL:(NSURL *)URL;


@end

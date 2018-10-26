//
//  YGRouter.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGRouteMediator.h"
#import "YGPassValue.h"


@interface YGLoginRouter : NSObject <YGRoute>

/** singleton instance */
+ (YGLoginRouter *)sharedInstance;

/** register ViewController's class */
- (void)registClass:(Class)cla withURL:(NSURL *)URL;

@end


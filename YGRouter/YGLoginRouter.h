//
//  YGRouter.h
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGRouteMediator.h"


@interface YGLoginRouter : NSObject <YGRoute>

/** shared instance */
+ (YGLoginRouter *)sharedInstance;

@end


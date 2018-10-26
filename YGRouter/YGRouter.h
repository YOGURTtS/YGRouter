//
//  YGRouter.h
//  YGRouter
//
//  Created by yogurts on 2018/10/26.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGRouteMediator.h"
#import "YGPassValue.h"

@interface YGRouter : NSObject <YGRoute>


/** register ViewController's class */
- (void)registClass:(Class)cla withURL:(NSURL *)URL;

@property (nonatomic, strong) NSMapTable *viewControllerMap;

@end

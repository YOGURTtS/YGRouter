//
//  YGParentSevice.h
//  YGRouter
//
//  Created by yogurts on 2018/10/30.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "SeviceMediator.h"

@interface YGCentralSevice : NSObject <YGSevice>

/** register protocol with class */
- (void)registProtocol:(Protocol *)protocol withClass:(Class)cla;

@end

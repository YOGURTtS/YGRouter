//
//  ViewController.m
//  YGModuleRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "ViewController.h"
#import "YGCentralRouter.h"
#import "YGLoginService.h"
#import "YGUserID.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    YGCentralService *service = [YGCentralService sharedInstance];
    Class cls = [service classWithProtocol:@protocol(YGUserID)];
    id<YGUserID>object = [cls new];
    NSString *userID = [object userId];
    
    YGCentralRouter *router = [YGCentralRouter sharedInstance];
//    if ([router canOpenURL:[NSURL URLWithString:@"scheme://Login/login?key1=value1"]]) {
//        [router pushToViewControllerWithURL:[NSURL URLWithString:@"scheme://Login/login?key1=value1"] parameters:@{@"key" : @"value"} fromViewController:self];
//    }
    router
    .scheme(@"scheme")
    .host(@"Login")
    .path(@"login")
    .query(@"key1=value1")
    .query(@"key2=value2")
    .query(@"key3=value3")
    .params(@{@"key" : @"value"})
    .params(@{@"key4" : @"value4"})
    .params(@{@"userID" : userID})
    .from(self)
    .push;
}



@end

//
//  ViewController.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "ViewController.h"
#import "YGParentRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    YGParentRouter *router = [YGParentRouter sharedInstance];
//    if ([router canOpenURL:[NSURL URLWithString:@"scheme://Login/login?key1=value1"]]) {
//        [router pushToViewControllerWithURL:[NSURL URLWithString:@"scheme://Login/login?key1=value1"] parameters:@{@"key" : @"value"} fromViewController:self];
//    }
    router
    .scheme(@"scheme")
    .host(@"Login")
    .path(@"login")
    .query(@"key1=value1")
    .params(@{@"key" : @"value"})
    .from(self)
    .push;
    
}



@end

//
//  ViewController.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "ViewController.h"
#import "YGRouteMediator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    YGRouteMediator *router = [YGRouteMediator sharedInstance];
    [router pushToViewControllerWithURL:[NSURL URLWithString:@"scheme://Login/login?key1=value1"] parameters:@{@"key" : @"value"} fromViewController:self];
}



@end

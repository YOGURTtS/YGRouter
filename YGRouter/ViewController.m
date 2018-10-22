//
//  ViewController.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "ViewController.h"
#import "YGLoginRouter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClicked:(UIButton *)sender {
    YGLoginRouter *router = [YGLoginRouter sharedInstance];
    UIViewController *vc = [router viewControllerWithClassName:@"YGViewController" parameters:@{@"key" : @"value"}];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}



@end

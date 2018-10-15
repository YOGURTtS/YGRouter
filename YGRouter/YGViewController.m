//
//  YGViewController.m
//  YGRouter
//
//  Created by 孙星 on 2018/10/13.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGViewController.h"

@interface YGViewController ()

@end

@implementation YGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)initViewContrellerWithParameters:(NSDictionary *)parameters {
    NSDictionary *dict = parameters;
    NSString *title = [dict objectForKey:@"key"];
    self.title = title;
}


@end

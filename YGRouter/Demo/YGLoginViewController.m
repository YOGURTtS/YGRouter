//
//  YGLoginViewController.m
//  YGModuleRouter
//
//  Created by yogurts on 2018/10/26.
//  Copyright © 2018 YOGURTS. All rights reserved.
//

#import "YGLoginViewController.h"
#import "YGLoginRouter.h"


@interface YGLoginViewController ()

@end

@implementation YGLoginViewController

+ (void)load {
    [[YGLoginRouter sharedInstance] registClass:[self class] withURL:[NSURL URLWithString:@"scheme://Login/login"]];
}

- (void)initViewContrellerWithParameters:(NSDictionary *)parameters {
    NSLog(@"%@", parameters);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

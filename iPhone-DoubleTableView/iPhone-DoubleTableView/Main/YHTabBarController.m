//
//  YHTabBarController.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/12.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHTabBarController.h"
#import "YHNavigationController.h"
#import "YHHomeViewController.h"
#import "YHHHViewController.h"
@interface YHTabBarController ()

@end

@implementation YHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupVC];
}


#pragma mark - 初始化控制器
- (void)setupVC {
    
    YHHHViewController *vc = [YHHHViewController new];
    YHNavigationController *nav = [[YHNavigationController alloc] initWithRootViewController:vc];
    
    self.viewControllers = @[nav];
}



@end

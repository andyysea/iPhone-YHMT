//
//  YHNavigationController.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/12.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHNavigationController.h"

@interface YHNavigationController ()

@end

@implementation YHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationBar.tintColor = [UIColor whiteColor];

}


- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}


@end

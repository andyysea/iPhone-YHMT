//
//  YHHHViewController.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/12.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHHHViewController.h"
#import "YHHomeViewController.h"

@interface YHHHViewController ()

@end

@implementation YHHHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick {
    YHHomeViewController *homeVC = [YHHomeViewController new];
    homeVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:homeVC animated:YES];
}



@end

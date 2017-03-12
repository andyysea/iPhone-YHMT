//
//  YHHomeViewController.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/12.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHHomeViewController.h"
#import "YHHHViewController.h"

@interface YHHomeViewController ()

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick {
    
    YHHHViewController *vc = [YHHHViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

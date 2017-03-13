//
//  YHCategoryContentView.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/13.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHCategoryContentView.h"

@implementation YHCategoryContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置界面元素
- (void)setupUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:tableView];
    
}



@end

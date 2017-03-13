//
//  YHProductContentView.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/13.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHProductContentView.h"
#import "YHHomeModel.h"

static NSString *productCellId = @"productCellId";
static NSString *headId = @"headId";

@interface YHProductContentView ()<UITableViewDataSource, UITableViewDelegate>

/** 单个产品类型对应的产品表格视图 */
@property (nonatomic, weak) UITableView *productTableView;

@end

@implementation YHProductContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.productModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YHHomeModel *model = self.productModelArray[section];
    return model.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:productCellId forIndexPath:indexPath];
    
    
    YHHomeModel *model = self.productModelArray[indexPath.section];
    cell.textLabel.text = model.products[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headId];
    YHHomeModel *model  = self.productModelArray[section];
    headView.textLabel.text = model.category;
 
    return headView;
}

#pragma mark - 设置界面元素
- (void)setupUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:tableView];
    
    tableView.sectionHeaderHeight = 30;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:productCellId];
    [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headId];
    
    _productTableView = tableView;
}


@end

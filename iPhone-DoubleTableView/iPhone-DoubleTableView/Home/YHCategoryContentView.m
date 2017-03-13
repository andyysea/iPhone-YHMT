//
//  YHCategoryContentView.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/13.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHCategoryContentView.h"
#import "YHHomeModel.h"

static NSString *categoryCellId = @"categoryCellId";

@interface YHCategoryContentView ()<UITableViewDataSource,UITableViewDelegate>

/** 产品分类表格视图 */
@property (nonatomic, weak) UITableView *categoryTableView;

@end

@implementation YHCategoryContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 这里将选中的分类对应的 indexPath 中对应数组的下标传递给控制器
    if (self.yhdelegate && [self.yhdelegate respondsToSelector:@selector(categoryContentView:didSelectIndexOfCategoryView:)]) {
        [self.yhdelegate categoryContentView:self didSelectIndexOfCategoryView:indexPath.row];
    }
    
    // 将选中的 row 滚动到表格视图的中间, 两种方法,任选其一
//    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
}

#pragma mark - 重写模型数组的set方法,传递数据
- (void)setCategoryModelArray:(NSArray *)categoryModelArray {
    _categoryModelArray = categoryModelArray;
    
    [self.categoryTableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoryModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCellId forIndexPath:indexPath];

    YHHomeModel *model = self.categoryModelArray[indexPath.row];
    cell.textLabel.text = model.category;
    
    return cell;
}

#pragma mark - 设置界面元素
- (void)setupUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:categoryCellId];
    
    
    _categoryTableView = tableView;
}



@end

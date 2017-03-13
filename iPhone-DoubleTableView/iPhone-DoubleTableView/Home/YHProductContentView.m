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

/** 是否向上滚动 */
@property (nonatomic, assign) BOOL IsScrollUp;
/** 拖拽的时候之前的 offsetY */
@property (nonatomic, assign) CGFloat previousOffsetY;
/** 是否是第一次初始化--> 用来控制初始化的时候一共不止一个组头的显示的时候重复调用代理方法,导致左侧分类没有选中第一个 */
@property (nonatomic, assign) BOOL IsFirstInitialize;

@end

@implementation YHProductContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


#pragma mark - 重写选中的左侧分类对应数据下标属性的setter方法
- (void)setSelectCategoryIndex:(NSInteger)selectCategoryIndex {
    _selectCategoryIndex = selectCategoryIndex;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:selectCategoryIndex];
    [self.productTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - UIScrollViewDelegate
/** 在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 控制器初始化默认左侧选中第一行的参数,再发生变化的时候这里修改
    if (self.IsFirstInitialize) {
        self.IsFirstInitialize = NO;
    }
    
    CGFloat offsetY = self.productTableView.contentOffset.y + self.productTableView.contentInset.top;

    // 刚刚滚动便宜的距离 与 之前的便宜的距离做比较,看看是否向上滚动
    self.IsScrollUp = (self.previousOffsetY < offsetY) ? YES : NO;
    self.previousOffsetY = offsetY;
    
//    NSLog(@"--> %zd",self.IsScrollUp);
}

/** 结束减速 --> 包含拖拽松手的时候速度本身为0 和 拖拽松手的时候速度不为0的时候慢慢减速为0 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSLog("111-->%zd-%zd-%zd",self.productTableView.isDecelerating,self.productTableView.isDragging,self.productTableView.isTracking);
    
    
}

/** 停止拖拽,将要减速 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    NSLog("222-->%zd-%zd-%zd",self.productTableView.isDecelerating,self.productTableView.isDragging,self.productTableView.isTracking);
}

#pragma mark - UITableViewDelegate
/** 自定义组头视图 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewHeaderFooterView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headId];
    YHHomeModel *model  = self.productModelArray[section];
    headView.textLabel.text = model.category;
    
    return headView;
}

/** 将要显示组头 --> 这个对应的是向下滚动 */
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    // 这个 if 用于初始化的时候,左侧能够选中第一行分类
    if (self.IsFirstInitialize && self.yhdelegate && [self.yhdelegate respondsToSelector:@selector(productView:willDisplayHeaderViewInSection:)] ) {
        [self.yhdelegate productView:self willDisplayHeaderViewInSection:0];
        return;
    }
    
    if (!self.IsScrollUp && self.productTableView.isDecelerating && self.yhdelegate && [self.yhdelegate respondsToSelector:@selector(productView:willDisplayHeaderViewInSection:)]) {
        [self.yhdelegate productView:self willDisplayHeaderViewInSection:section];
    }
}

/** 结束显示组头 --> 这个对应的是向上滚动 */
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    if (self.IsScrollUp && self.productTableView.isDecelerating && self.yhdelegate && [self.yhdelegate respondsToSelector:@selector(productView:didEndDisplayHeaderViewInSection:)]) {
        [self.yhdelegate productView:self didEndDisplayHeaderViewInSection:section];
    }
}

/** 选中的cell */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"IndexPath.row --> %zd", indexPath.row);
}

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

#pragma mark - 设置界面元素
- (void)setupUI {
    // 初始化为暂时没有向上滚动
    _IsScrollUp = NO;
    // 初始化是第一次加载,避免初始化显示多个组头的时候,重复调用代理方法,导致左侧分类选中的分类不是第一个
    // 这个参数可以在 做视图做滚动的方法里面修改,因为点击左侧分类,或者直接滚动右侧,视图都会滚动
    _IsFirstInitialize = YES;
    
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

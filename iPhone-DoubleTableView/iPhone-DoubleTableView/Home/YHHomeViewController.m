//
//  YHHomeViewController.m
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/12.
//  Copyright © 2017年 junde. All rights reserved.
//

#import "YHHomeViewController.h"
#import "YHCategoryContentView.h" // 左侧分类视图
#import "YHProductContentView.h"  // 右侧对应的左侧分类产品视图
#import "YHHomeModel.h"

@interface YHHomeViewController ()<YHCategoryContentViewDelegate>
/** 左侧分类视图 */
@property (nonatomic, weak) YHCategoryContentView *categoryView;
/** 左侧单个分类对应的产品详情视图 */
@property (nonatomic, weak) YHProductContentView *productView;

/** 数据源 */
@property (nonatomic, strong) NSArray *modelArray;

@end

@implementation YHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self initializeDataArray];
}


#pragma mark - YHCategoryContentViewDelegate
- (void)categoryContentView:(YHCategoryContentView *)categoryView didSelectIndexOfCategoryView:(NSInteger)index {
    NSLog(@"选中的分类对应模型数组中的下标为 %zd", index);
}

#pragma mark - 初始化数据源
- (void)initializeDataArray {
    
    NSArray *productArray = @[@"鞋子",@"衣服",@"化妆品",@"饮用水",@"副食品",@"小吃",@"鞋子",@"衣服",@"化妆品",@"饮用水"];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSInteger i = 0; i < 20 ; i++) {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        NSString *categoryStr = [NSString stringWithFormat:@"第 %zd 类", i];
        [dictM setObject:categoryStr forKey:@"category"];
        [dictM setObject:productArray forKey:@"products"];
        
        YHHomeModel *model = [YHHomeModel new];
        [model setValuesForKeysWithDictionary:dictM];
        
        [arrayM addObject:model];
    }
    self.modelArray = arrayM.copy;
    
    // 传递数据
    self.categoryView.categoryModelArray = self.modelArray;
    self.productView.productModelArray = self.modelArray;
}


#pragma mark - 设置界面元素
- (void)setupUI {
    self.title = @"商家名称";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 左侧分类视图
    YHCategoryContentView *categoryView = [[YHCategoryContentView alloc] initWithFrame:CGRectMake(0, 64, 100, Height_Screen)];
    categoryView.backgroundColor = [UIColor  lightGrayColor];
    [self.view addSubview:categoryView];
    
    categoryView.yhdelegate = self;
    
    // 左侧分类对应的右侧视图
    YHProductContentView *productView = [[YHProductContentView alloc] initWithFrame:CGRectMake(100, 64, Width_Screen - 100, Height_Screen)];
    productView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:productView];
    
    // 属性记录
    _categoryView = categoryView;
    _productView = productView;
}



#pragma mark - 更改状态栏前景颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end

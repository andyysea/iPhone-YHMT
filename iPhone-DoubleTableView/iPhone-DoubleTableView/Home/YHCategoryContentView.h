//
//  YHCategoryContentView.h
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/13.
//  Copyright © 2017年 junde. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHCategoryContentView;

@protocol YHCategoryContentViewDelegate <NSObject>
/** 分类视图的代理方法,返回选中的哪个分类对应的模型数组中的下标 */
- (void)categoryContentView:(YHCategoryContentView *)categoryView didSelectIndexOfCategoryView:(NSInteger)index;

@end


@interface YHCategoryContentView : UIView

/** 模型数组 */
@property (nonatomic, strong) NSArray *categoryModelArray;

/** 代理属性 */
@property (nonatomic, weak) id yhdelegate;

@end

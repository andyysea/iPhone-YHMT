//
//  YHProductContentView.h
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/13.
//  Copyright © 2017年 junde. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHProductContentView;

@protocol YHProductContentViewDelegate <NSObject>

/** 向下滚动 */
- (void)productView:(YHProductContentView *)productView willDisplayHeaderViewInSection:(NSInteger)section;
/** 向上滚动 */
- (void)productView:(YHProductContentView *)productView didEndDisplayHeaderViewInSection:(NSInteger)section;

@end


@interface YHProductContentView : UIView

/** 模型数组 */
@property (nonatomic, strong) NSArray *productModelArray;

/** 点击左边表格cell 对应数组的下标 */
@property (nonatomic, assign) NSInteger selectCategoryIndex;

/** 代理属性 */
@property (nonatomic, weak) id <YHProductContentViewDelegate>yhdelegate;

@end

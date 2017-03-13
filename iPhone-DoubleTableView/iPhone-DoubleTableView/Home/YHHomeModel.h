//
//  YHHomeModel.h
//  iPhone-DoubleTableView
//
//  Created by junde on 2017/3/13.
//  Copyright © 2017年 junde. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHHomeModel : NSObject

/** 分类模型 */
@property (nonatomic, copy) NSString *category;

/** 右侧对应的左侧各个分类的产品分类数组 */
@property (nonatomic, strong) NSArray *products;

@end

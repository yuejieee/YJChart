//
//  YJLineChart.h
//  YJChart
//
//  Created by yuejieee on 2017/4/18.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJLineChart : UIView
/**
 x轴数组
 */
@property (nonatomic, strong) NSArray *xValueArray;
/**
 y轴数组
 */
@property (nonatomic, strong) NSArray *yValueArray;

/**
 数据数组
 */
@property (nonatomic, strong) NSArray *dataArray;

- (instancetype)initWithFrame:(CGRect)frame xValueArray:(NSArray *)xValueArray yValueArray:(NSArray *)yValueArray dataArray:(NSArray *)dataArray;

@end

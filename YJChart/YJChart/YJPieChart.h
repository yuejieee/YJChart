//
//  YJPieChart.h
//  YJChart
//
//  Created by yuejieee on 2017/5/5.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJPieChart : UIView
/**
 数值数组
 */
@property (nonatomic, strong) NSArray *valueArray;

- (instancetype)initWithFrame:(CGRect)frame valueArray:(NSArray *)array;

- (void)animation;

@end

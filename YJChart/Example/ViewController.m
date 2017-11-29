//
//  ViewController.m
//  YJChart
//
//  Created by yuejieee on 2017/4/18.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "ViewController.h"
#import "YJLineChart.h"
#import "YJPieChart.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 折线图
    YJLineChart *lineChart = [[YJLineChart alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 300)];
    [self.view addSubview:lineChart];
    lineChart.xValueArray = @[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月", @"7月", @"8月", @"9月", @"10月", @"11月", @"12月"];
    lineChart.yValueArray = @[@"50", @"100", @"150", @"200", @"250", @"300", @"350", @"400"];
    lineChart.dataArray = @[@"120", @"240", @"230", @"190", @"150", @"200", @"230", @"400", @"350", @"340", @"360", @"330"];
    
    // 饼状图
    YJPieChart *pieChart = [[YJPieChart alloc] initWithFrame:CGRectMake(0, 360, self.view.frame.size.width, 300)];
    [self.view addSubview:pieChart];
    pieChart.valueArray = @[@"300", @"500", @"400", @"1000"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

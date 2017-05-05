//
//  ViewController.m
//  YJChart
//
//  Created by Kingpin on 2017/4/18.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "ViewController.h"
#import "YJLineChart.h"
#import "YJPieChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YJLineChart *lineChart = [YJLineChart new];
    [self.view addSubview:lineChart];
    lineChart.frame = CGRectMake(0, 50, self.view.frame.size.width, 300);
    [lineChart setYValuesWithArray:@[@"50", @"100", @"150", @"200", @"250", @"300", @"350", @"400"]];
    [lineChart setXValuesWithArray:@[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月", @"7月", @"8月", @"9月", @"10月", @"11月", @"12月"]];
    [lineChart setDataArray:@[@"120", @"240", @"230", @"190", @"150", @"200", @"230", @"400", @"350", @"340", @"360", @"330"]];
    
    YJPieChart *pieChart = [YJPieChart new];
    [self.view addSubview:pieChart];
    pieChart.frame = CGRectMake(0, 350, self.view.frame.size.width, 300);
    [pieChart setValueWithArray:@[@"1", @"2", @"4"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

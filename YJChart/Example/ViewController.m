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

@property (nonatomic, strong) YJPieChart *pieChart;

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
    
    self.pieChart = [YJPieChart new];
    [self.view addSubview:self.pieChart];
    self.pieChart.frame = CGRectMake(0, 360, self.view.frame.size.width, 300);
    [self.pieChart setValueWithArray:@[@"1", @"2", @"4"]];
    [self.pieChart animation];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.pieChart addGestureRecognizer:tap];
}

- (void)tapAction {
    [self.pieChart animation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

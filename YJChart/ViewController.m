//
//  ViewController.m
//  YJChart
//
//  Created by Kingpin on 2017/4/18.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "ViewController.h"
#import "YJLineChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YJLineChart *lineChart = [YJLineChart new];
    [self.view addSubview:lineChart];
    lineChart.frame = CGRectMake(0, 50, self.view.frame.size.width, 300);
    [lineChart setYLabels:@[@"50", @"100", @"150", @"200", @"250", @"300", @"350", @"400"]];
    [lineChart setXLabels:@[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月", @"7月", @"8月", @"9月", @"10月", @"11月", @"12月"]];
    [lineChart setDataArray:@[@"120", @"240", @"230", @"190", @"150", @"200", @"230", @"400", @"350", @"340", @"360", @"330"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

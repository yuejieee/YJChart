# YJChart
折线图
<img src="https://github.com/yuejieee/YJChart/blob/master/%E6%8A%98%E7%BA%BF%E5%9B%BE.png" width=300/>
饼状图
<img scr="https://github.com/yuejieee/YJChart/blob/master/%E9%A5%BC%E7%8A%B6%E5%9B%BE.png" width=300/>
## Description
基于UIBezierPath的一个图表的封装，目前加入了折线图和饼状图，以后有时间会加上柱状图。

## Usage

```
// 折线图
#import YJLineChart

YJLineChart *lineChart = [YJLineChart new];
[self.view addSubview:lineChart];
lineChart.frame = CGRectMake(0, 50, self.view.frame.size.width, 300);
[lineChart setYLabels:@[@"50", @"100", @"150", @"200", @"250", @"300", @"350", @"400"]];
[lineChart setXLabels:@[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月", @"7月", @"8月", @"9月", @"10月", @"11月", @"12月"]];
[lineChart setDataArray:@[@"120", @"240", @"230", @"190", @"150", @"200", @"230", @"400", @"350", @"340", @"360", @"330"]];

// 饼状图
#import YJPieChart

YJPieChart *pieChart = [YJPieChart new];
[self.view addSubview:pieChart];
pieChart.frame = CGRectMake(0, 350, self.view.frame.size.width, 300);
[pieChart setValueWithArray:@[@"1", @"2", @"4"]];
```

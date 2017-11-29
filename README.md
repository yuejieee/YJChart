# YJChart

<img src="https://github.com/yuejieee/YJChart/blob/master/%E6%8A%98%E7%BA%BF%E5%9B%BE.png" width=350/>
<img src ="https://github.com/yuejieee/YJChart/blob/master/%E9%A5%BC%E7%8A%B6%E5%9B%BE.png" width=350/>

## Description
基于UIBezierPath的一个图表的封装，目前加入了折线图和饼状图，以后有时间会加上柱状图。

## Usage

```
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
```

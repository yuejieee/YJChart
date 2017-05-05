//
//  YJPieChart.m
//  YJChart
//
//  Created by Kingpin on 2017/5/5.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "YJPieChart.h"

@implementation YJPieChart

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setValueWithArray:(NSArray *)array {
    CGFloat sum = 0;
    for (NSString *value in array) {
        sum += [value floatValue];
    }
    
    CGPoint centerPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    for (NSString *value in array) {
        CGFloat per = [value floatValue] / sum;
        endAngle = startAngle + M_PI * 2 * per;
        CAShapeLayer *shapeLayer = [CAShapeLayer new];
        [self.layer addSublayer:shapeLayer];
        shapeLayer.fillColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1].CGColor;
        UIBezierPath *path = [UIBezierPath new];
        [path moveToPoint:centerPoint];
        [path addArcWithCenter:centerPoint radius:centerPoint.x / 2 startAngle:startAngle endAngle:endAngle clockwise:YES];
        [path addLineToPoint:centerPoint];
        shapeLayer.path = path.CGPath;
        startAngle = endAngle;
    }
}

@end

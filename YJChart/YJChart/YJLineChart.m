//
//  YJLineChart.m
//  YJChart
//
//  Created by Kingpin on 2017/4/18.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "YJLineChart.h"

#define bounceX 30
#define bounceY 50

@implementation YJLineChart

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, bounceX, bounceY);
    CGContextAddLineToPoint(context, bounceX, rect.size.height - bounceY);
    CGContextAddLineToPoint(context, rect.size.width -  bounceX, rect.size.height - bounceY);
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextStrokePath(context);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed: 28/255.0 green: 207/255.0 blue: 155/255.0 alpha: 1.0];
    }
    return self;
}

- (void)setXLabels:(NSArray *)array {
    CGFloat labelWidth = (self.bounds.size.width - bounceX * 2) / array.count;
    for (NSInteger i = 0; i < array.count; i++) {
        UILabel *label = [UILabel new];
        [self addSubview:label];
        label.frame = CGRectMake(bounceX + i * labelWidth, self.bounds.size.height - bounceY + 5, labelWidth, 20);
        label.text = [NSString stringWithFormat:@"%ld月", i + 1];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10 weight:2];
        label.transform = CGAffineTransformMakeRotation(M_PI * 0.3);
        label.tag = 1000 + i;
    }
}

- (void)setYLabels:(NSArray *)array {
    CGFloat yLineHeight = self.bounds.size.height - bounceY * 2;
    CGFloat labelHeight = yLineHeight / array.count;
    for (NSInteger i = 0; i < array.count; i++) {
        UILabel *label = [UILabel new];
        [self addSubview:label];
        label.frame = CGRectMake(0, yLineHeight + labelHeight / 2 - i * labelHeight, 30, labelHeight);
        label.text = array[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10 weight:2];
        label.tag = 2000 + i;
    }
    [self setupDottedLineWithCount:array.count];
}

- (void)setupDottedLineWithCount:(NSInteger)count {
    for (NSInteger i = 0; i < count; i++) {
        CAShapeLayer *shapLayer = [CAShapeLayer layer];
        shapLayer.strokeColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;
        shapLayer.lineWidth = 2;
        UILabel *label = [self viewWithTag:2000 + i];
        UIBezierPath *path = [UIBezierPath new];
        [path setLineWidth:1];
        [path moveToPoint:CGPointMake(bounceX, label.center.y)];
        [path addLineToPoint:CGPointMake(self.frame.size.width - bounceX, label.center.y)];
        shapLayer.path = path.CGPath;
        [self.layer addSublayer:shapLayer];
    }
}

- (void)setDataArray:(NSArray *)array {
    CGFloat maxValue = [[array valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat yLineHeight = self.bounds.size.height - bounceY * 2;
    CGFloat labelWidth = self.bounds.size.width / array.count;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 2;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    UIBezierPath *path = [UIBezierPath new];
    [path setLineWidth:1];
    for (NSInteger i = 0; i < array.count; i++) {
        UILabel *label = [self viewWithTag:1000 + i];
        CGFloat value = [array[i] floatValue];
        CGFloat pointY = yLineHeight + bounceY - value / maxValue * yLineHeight;
        UILabel *dataLabel = [UILabel new];
        dataLabel.frame = CGRectMake(0, 0, labelWidth, 20);
        dataLabel.text = array[i];
        dataLabel.font = [UIFont systemFontOfSize:10 weight:2];
        dataLabel.textAlignment = NSTextAlignmentCenter;
        dataLabel.textColor = [UIColor whiteColor];
        [self addSubview:dataLabel];
        CGPoint point = CGPointMake(label.center.x, pointY);
        if (i == 0) {
            [path moveToPoint:point];
            dataLabel.center = CGPointMake(label.center.x, pointY + 10);
        } else {
            [path addLineToPoint:point];
            if ([array[i - 1] floatValue] > [array[i] floatValue]) {
                dataLabel.center = CGPointMake(label.center.x, pointY + 10);
            } else {
                dataLabel.center = CGPointMake(label.center.x, pointY - 10);
            }
        }
        UIBezierPath *circlePath = [UIBezierPath new];
        [circlePath addArcWithCenter:point radius:2 startAngle:M_PI endAngle:M_PI * 3 clockwise:YES];
        [path appendPath:circlePath];
    }
    shapeLayer.path = path.CGPath;
    [self.layer addSublayer:shapeLayer];
}

@end

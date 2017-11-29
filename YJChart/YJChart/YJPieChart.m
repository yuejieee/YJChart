//
//  YJPieChart.m
//  YJChart
//
//  Created by yuejieee on 2017/5/5.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "YJPieChart.h"

@interface YJPieChart ()

@property (nonatomic, strong) CAShapeLayer *bgLayer;

@end

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
    CGFloat circleRadius = centerPoint.x < centerPoint.y ? centerPoint.x : centerPoint.y;
    
    // 底部layer
    self.bgLayer = [CAShapeLayer new];
    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                          radius:circleRadius
                                                      startAngle:-M_PI_2
                                                        endAngle:M_PI_2 * 3
                                                       clockwise:YES];
    self.bgLayer = [CAShapeLayer layer];
    self.bgLayer.fillColor = [UIColor clearColor].CGColor;
    self.bgLayer.strokeColor = self.backgroundColor.CGColor;
    self.bgLayer.strokeStart = 0.0f;
    self.bgLayer.strokeEnd = 1.0f;
    // 可根据控制lineWidth来实现实心圆或者空心圆
    self.bgLayer.lineWidth = circleRadius * 2;
    self.bgLayer.path = bgPath.CGPath;
    
    // 主体
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = 0;
    for (NSString *value in array) {
        CGFloat per = [value floatValue] / sum;
        endAngle = startAngle + M_PI * 2 * per;
        CAShapeLayer *shapeLayer = [CAShapeLayer new];
        [self.layer addSublayer:shapeLayer];
        shapeLayer.fillColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1].CGColor;
        UIBezierPath *path = [UIBezierPath new];
        [path moveToPoint:centerPoint];
        [path addArcWithCenter:centerPoint radius:circleRadius startAngle:startAngle endAngle:endAngle clockwise:YES];
        [path addLineToPoint:centerPoint];
        shapeLayer.path = path.CGPath;
        startAngle = endAngle;
    }
    
    self.layer.mask = self.bgLayer;
}

- (void)animation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration  = 5;
    animation.fromValue = @0.0f;
    animation.toValue   = @1.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = YES;
    [self.bgLayer addAnimation:animation forKey:@"circleAnimation"];
}

@end

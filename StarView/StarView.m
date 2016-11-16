//
//  StarView.m
//  StarView
//
//  Created by FlyKite on 16/10/31.
//  Copyright © 2016年 FlyKite. All rights reserved.
//

#import "StarView.h"

@interface StarView ()
@property (strong, nonatomic) CAShapeLayer *nowStarLayer;
@property (assign, nonatomic) CGPoint startPoint;
@end

@implementation StarView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.enabled = YES;
        self.lineWidth = 1;
        self.strokeColor = [UIColor blackColor];
    }
    return self;
}

- (UIBezierPath *)starPathWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
    
    NSArray *points = [self pointsOfStarVertexWithPoint1:point1 andPoint2:point2];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[points[0] CGPointValue]];
    [path addLineToPoint:[points[1] CGPointValue]];
    [path addLineToPoint:[points[2] CGPointValue]];
    [path addLineToPoint:[points[3] CGPointValue]];
    [path addLineToPoint:[points[4] CGPointValue]];
    [path addLineToPoint:[points[0] CGPointValue]];

    return path;
}

- (NSArray<NSValue *> *)pointsOfStarVertexWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
    
    CGFloat lineLength = sqrt(pow(point1.x - point2.x, 2) + pow(point1.y - point2.y, 2));
    CGPoint line1Center = CGPointMake((point1.x + point2.x) / 2, (point1.y + point2.y) / 2);
    CGFloat radius = lineLength / 2 / cos(M_PI / 10);
    
    CGFloat line1k = (point2.y - point1.y) / (point2.x - point1.x);
    CGFloat k = -1 / line1k;
    CGFloat angle = atan(k);
    
    CGFloat t = point2.y < point1.y ? -1 : 1;
    CGFloat tLength = sin(M_PI / 10) * radius;
    CGPoint center = CGPointMake(line1Center.x - cos(angle) * tLength * t, line1Center.y - sin(angle) * tLength * t);
    CGPoint point4 = CGPointMake(center.x + cos(angle) * radius * t, center.y + sin(angle) * radius * t);
    
    t = center.y < point1.y ? -1 : 1;
    CGFloat point1CenterLineK = (center.y - point1.y) / (center.x - point1.x);
    CGFloat point34LineK = -1 / point1CenterLineK;
    CGFloat angle2 = atan(point34LineK);
    CGPoint point3 = CGPointMake(point4.x - cos(angle2) * lineLength * t, point4.y - sin(angle2) * lineLength * t);
    
    t = point2.y < center.y ? -1 : 1;
    CGFloat point2CenterLineK = (center.y - point2.y) / (center.x - point2.x);
    CGFloat point45LineK = -1 / point2CenterLineK;
    CGFloat angle4 = atan(point45LineK);
    CGPoint point5 = CGPointMake(point4.x - cos(angle4) * lineLength * t, point4.y - sin(angle4) * lineLength * t);
    
    NSMutableArray *points = [NSMutableArray arrayWithCapacity:5];
    [points addObject:[NSValue valueWithCGPoint:point1]];
    [points addObject:[NSValue valueWithCGPoint:point2]];
    [points addObject:[NSValue valueWithCGPoint:point3]];
    [points addObject:[NSValue valueWithCGPoint:point4]];
    [points addObject:[NSValue valueWithCGPoint:point5]];
    
    return [points copy];
}

- (NSArray<NSValue *> *)pointsOfStarWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
    
    CGFloat lineLength = sqrt(pow(point1.x - point2.x, 2) + pow(point1.y - point2.y, 2));
    CGPoint line1Center = CGPointMake((point1.x + point2.x) / 2, (point1.y + point2.y) / 2);
    CGFloat radius = lineLength / 2 / cos(M_PI / 10);
    
    CGFloat line1k = (point2.y - point1.y) / (point2.x - point1.x);
    CGFloat k = -1 / line1k;
    CGFloat angle = atan(k);
    
    CGFloat t = point2.y < point1.y ? -1 : 1;
    CGFloat tLength = sin(M_PI / 10) * radius;
    CGPoint center = CGPointMake(line1Center.x - cos(angle) * tLength * t, line1Center.y - sin(angle) * tLength * t);
    CGPoint point4 = CGPointMake(center.x + cos(angle) * radius * t, center.y + sin(angle) * radius * t);
    
    t = center.y < point1.y ? -1 : 1;
    CGFloat point1CenterLineK = (center.y - point1.y) / (center.x - point1.x);
    CGFloat point34LineK = -1 / point1CenterLineK;
    CGFloat angle2 = atan(point34LineK);
    CGPoint point3 = CGPointMake(point4.x - cos(angle2) * lineLength * t, point4.y - sin(angle2) * lineLength * t);
    
    t = point2.y < center.y ? -1 : 1;
    CGFloat point2CenterLineK = (center.y - point2.y) / (center.x - point2.x);
    CGFloat point45LineK = -1 / point2CenterLineK;
    CGFloat angle4 = atan(point45LineK);
    CGPoint point5 = CGPointMake(point4.x - cos(angle4) * lineLength * t, point4.y - sin(angle4) * lineLength * t);
    
    NSMutableArray *points = [NSMutableArray arrayWithCapacity:5];
    [points addObject:[NSValue valueWithCGPoint:point1]];
    [points addObject:[NSValue valueWithCGPoint:point2]];
    [points addObject:[NSValue valueWithCGPoint:point3]];
    [points addObject:[NSValue valueWithCGPoint:point4]];
    [points addObject:[NSValue valueWithCGPoint:point5]];
    
    return [points copy];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.enabled) {
        return;
    }
    UITouch *touch = touches.allObjects[0];
    self.startPoint = [touch locationInView:self];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = self.lineWidth;
    layer.strokeColor = self.strokeColor.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:layer];
    self.nowStarLayer = layer;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.enabled) {
        return;
    }
    UITouch *touch = touches.allObjects[0];
    CGPoint point2 = [touch locationInView:self];
    UIBezierPath *path = [self starPathWithPoint1:self.startPoint andPoint2:point2];
    self.nowStarLayer.path = path.CGPath;
}

- (void)clear {
    NSArray *layers = self.layer.sublayers;
    for (NSInteger i = 0; i < layers.count; i++) {
        CALayer *layer = layers[i];
        [layer removeFromSuperlayer];
    }
}
@end

//
//  StarView.h
//  StarView
//
//  Created by FlyKite on 16/10/31.
//  Copyright © 2016年 FlyKite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
@property (assign, nonatomic) BOOL enabled;
- (UIBezierPath *)starPathWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;
- (void)clear;
@property (assign, nonatomic) CGFloat lineWidth;
@property (strong, nonatomic) UIColor *strokeColor;
@end

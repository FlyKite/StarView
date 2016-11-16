//
//  StarView.h
//  StarView
//
//  Created by FlyKite on 16/10/31.
//  Copyright © 2016年 FlyKite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView

@property (assign, nonatomic) BOOL enabled; // 默认为YES

@property (assign, nonatomic) CGFloat lineWidth;    // 默认为1
@property (strong, nonatomic) UIColor *strokeColor; // 默认为黑色

/**
 * 通过从传入两个点获取一个星形的UIBezierPath对象
 *
 * @param point1 起始点
 * @param point2 第二个点
 * @return 星形的UIBezierPath对象
 */
- (UIBezierPath *)starPathWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;

/**
 * 通过从传入两个点获取五角星形的五个顶点
 *
 * @param point1 起始点
 * @param point2 第二个点
 * @return 五角星形的五个顶点数组，数组中元素为NSValue存储的CGPoint（包括传入的两个点）
 */
- (NSArray<NSValue *> *)pointsOfStarVertexWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;

/** TODO:目前返回结果与pointsOfStarVertexWithPoint1:andPoint2:方法相同
 * 通过从传入两个点获取五角星形的十个点（五个定点与五个内凹的点）
 *
 * @param point1 起始点
 * @param point2 第二个点
 * @return 五角星形的十个点，数组中元素为NSValue存储的CGPoint（包括传入的两个点）
 */
- (NSArray<NSValue *> *)pointsOfStarWithPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;

/**
 * 清除当前view中所画出的所有五角星
 */
- (void)clear;
@end

//
//  UIView+Common.h
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Common)

- (void)doCircleFrame;
- (CGFloat)maxXOfFrame;

- (void)addGradientLayerWithColors:(NSArray *)cgColorArray;
- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )aPoint endPoint:(CGPoint)endPoint;

@end

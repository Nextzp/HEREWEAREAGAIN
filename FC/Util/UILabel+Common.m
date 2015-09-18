//
//  UILabel+Common.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel(Common)

+ (UILabel *)labelWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)alignment{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = alignment;
    label.textColor = textColor;
    label.font = font;
    return label;
}

@end

//
//  UILabel+Common.h
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UILabel(Common)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)alignment;

- (void) setLongString:(NSString *)str withFitWidth:(CGFloat)width;
- (void) setLongString:(NSString *)str withFitWidth:(CGFloat)width maxHeight:(CGFloat)maxHeight;
- (void) setLongString:(NSString *)str withVariableWidth:(CGFloat)maxWidth;

+ (instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor;

@end

//
//  NSString+Common.h
//  FC
//
//  Created by ZhangPeng on 15/9/20.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Common)

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end

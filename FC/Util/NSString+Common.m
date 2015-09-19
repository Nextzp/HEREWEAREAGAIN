//
//  NSString+Common.m
//  FC
//
//  Created by ZhangPeng on 15/9/20.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString(Common)

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    CGSize resultSize = CGSizeZero;
    if (self.length <= 0) {
        return resultSize;
    }
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        resultSize = [self boundingRectWithSize:size
                                        options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                     attributes:@{NSFontAttributeName: font}
                                        context:nil].size;
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        resultSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        //        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
        //
        //        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        //        [paragraphStyle setLineSpacing:2.0];
        //
        //        [attributedStr addAttribute:NSParagraphStyleAttributeName
        //                              value:paragraphStyle
        //                              range:NSMakeRange(0, [self length])];
        //        resultSize = [attributedStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
        
#endif
    }
    resultSize = CGSizeMake(MIN(size.width, ceilf(resultSize.width)), MIN(size.height, ceilf(resultSize.height)));
    //    if ([self containsEmoji]) {
    //        resultSize.height += 10;
    //    }
    return resultSize;
}

- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:font constrainedToSize:size].height;
}
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:font constrainedToSize:size].width;
}

@end

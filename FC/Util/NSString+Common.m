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

+ (NSString *)unitWithNumber:(NSString *)str{
    if ([str longLongValue] >= 10000) {
        return [NSString stringWithFormat:@"%lld万",[str longLongValue]/10000];
    }else{
        return str;
    }
}

+ (BOOL)isMobileNumberClassification:(NSString *)mobileString{
    /**
    * 手机号码
    * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
    * 联通：130,131,132,152,155,156,185,186,1709
    * 电信：133,1349,153,180,189,1700
    */
    //    NSString * MOBILE = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])\\d{7}$";//总况
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    
    if (([regextestcm evaluateWithObject:mobileString] == YES)
        || ([regextestct evaluateWithObject:mobileString] == YES)
        || ([regextestcu evaluateWithObject:mobileString] == YES)
        || ([regextestphs evaluateWithObject:mobileString] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
@end

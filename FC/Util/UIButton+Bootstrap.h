//
//  UIButton+Bootstrap.h
//  Barcelona
//
//  Created by 张朋 on 15/8/13.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+FontAwesome.h"

typedef enum {
    StrapBootstrapStyle = 0,
    StrapDefaultStyle,
    StrapPrimaryStyle,
    StrapSuccessStyle,
    StrapInfoStyle,
    StrapWarningStyle,
    StrapDangerStyle,
    StrapMainStyle
} StrapButtonStyle;

@interface UIButton(Bootstrap)

- (void)addAwesomeIcon:(FAIcon)icon beforeTitle:(BOOL)before;
- (void)bootstrapStyle;
- (void)defaultStyle;
- (void)primaryStyle;
- (void)successStyle;
- (void)infoStyle;
- (void)warningStyle;
- (void)dangerStyle;
- (void)mainStyle;
- (UIImage *) buttonImageFromColor:(UIColor *)color ;

+ (UIButton *)buttonWithStyle:(StrapButtonStyle)style
                     andTitle:(NSString *)title
                     andFrame:(CGRect)rect
                       target:(id)target
                       action:(SEL)selector;

@end

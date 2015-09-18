//
//  TabBarItemButton.h
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarItemButton : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                  normalImage:(UIImage *)normalImage
               highlightImage:(UIImage *)highlightImage;

@end

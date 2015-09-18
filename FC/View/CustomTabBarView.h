//
//  CustomTabBarView.h
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CustomTabBarViewBlock)(NSInteger itemIndex);

@interface CustomTabBarView : UIView

@property (assign, nonatomic) NSInteger currentIndex;
@property (copy, nonatomic) CustomTabBarViewBlock itemIndex;

- (void)setItemIndex:(CustomTabBarViewBlock)itemIndex;

@end

//
//  CustomNavigationView.h
//  FC
//
//  Created by ZhangPeng on 15/9/11.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationView : UIView{
    UIButton *backBtn;
}

@property (strong, nonatomic) UILabel *navTitleLabel;

- (void)hiddenBackButton:(BOOL)isHidden;

@end

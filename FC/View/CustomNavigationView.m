//
//  CustomNavigationView.m
//  FC
//
//  Created by ZhangPeng on 15/9/11.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "CustomNavigationView.h"

@implementation CustomNavigationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        [self viewInitialize];
    }
    return self;
}

- (void)viewInitialize{
    backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
    [backBtn setImage:[UIImage imageNamed:@"back_arrow"] forState:UIControlStateNormal];
    [self addSubview:backBtn];
    
    self.navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 20, kScreen_Width-88, 44)];
    [self.navTitleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [self.navTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.navTitleLabel setTextColor:[UIColor whiteColor]];
    [self.navTitleLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.navTitleLabel];
}

- (void)hiddenBackButton:(BOOL)isHidden{
    backBtn.hidden = isHidden;
}

@end

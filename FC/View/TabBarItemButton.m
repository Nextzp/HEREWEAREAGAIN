//
//  TabBarItemButton.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "TabBarItemButton.h"

@interface TabBarItemButton()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *itemImageView;

@end

@implementation TabBarItemButton

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title normalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_titleLabel ) {
            _titleLabel = [UILabel labelWithFrame:CGRectMake(0, self.height-20, self.width, 20) font:[UIFont systemFontOfSize:10] textColor:[UIColor darkGrayColor] textAlignment:NSTextAlignmentCenter];
            _titleLabel.text = title;
            [self addSubview:_titleLabel];
        }
        if (!_itemImageView) {
            _itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3, self.width, self.height-20)];
            [_itemImageView setImage:normalImage];
            [_itemImageView.layer setMasksToBounds:YES];
            [_itemImageView setContentMode:UIViewContentModeCenter];
            [self addSubview:_itemImageView];
        }
    }
    return self;
}

@end

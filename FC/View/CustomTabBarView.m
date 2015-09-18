//
//  CustomTabBarView.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "CustomTabBarView.h"
#import "TabBarItemButton.h"

#define ITEMWIDTH kScreen_Width/5

@interface CustomTabBarView()

@property (strong, nonatomic) TabBarItemButton *friendItem, *shareItem, *publicItem, *recordItem, *centerItem;

@end

@implementation CustomTabBarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        WeakSelfType blockSelf = self;
        self.currentIndex = 0;
        self.backgroundColor = [UIColor clearColor];
        [self.layer setBorderWidth:0.5];
        [self.layer setBorderColor:[RGB(225, 225, 225) CGColor]];
        if (!_friendItem) {
            _friendItem = [[TabBarItemButton alloc] initWithFrame:CGRectMake(0, 0, ITEMWIDTH, self.height) title:@"朋友" normalImage:[UIImage imageNamed:@"task_normal"] highlightImage:[UIImage imageNamed:@"task_selected"]];
            [_friendItem bk_whenTapped:^{
                [blockSelf itemCliceked:0];
            }];
            [self addSubview:_friendItem];
        }
        if (!_shareItem) {
            _shareItem = [[TabBarItemButton alloc] initWithFrame:CGRectMake(ITEMWIDTH, 0, ITEMWIDTH, self.height) title:@"发现" normalImage:[UIImage imageNamed:@"tweet_normal"] highlightImage:[UIImage imageNamed:@"tweet_selected"]];
            [_shareItem bk_whenTapped:^{
                [blockSelf itemCliceked:1];
            }];
            [self addSubview:_shareItem];
        }
        if (!_publicItem) {
            _publicItem = [[TabBarItemButton alloc] initWithFrame:CGRectMake(ITEMWIDTH*2, 0, ITEMWIDTH, self.height) title:@"发布" normalImage:nil highlightImage:nil];
            [_shareItem bk_whenTapped:^{
                [blockSelf itemCliceked:2];
            }];
            [self addSubview:_publicItem];
        }
        if (!_recordItem) {
            _recordItem = [[TabBarItemButton alloc] initWithFrame:CGRectMake(ITEMWIDTH*3, 0, ITEMWIDTH, self.height) title:@"足迹" normalImage:[UIImage imageNamed:@"project_normal"] highlightImage:[UIImage imageNamed:@"project_selected"]];
            [_recordItem bk_whenTapped:^{
                [blockSelf itemCliceked:3];
            }];
            [self addSubview:_recordItem];
        }
        if (!_centerItem) {
            _centerItem = [[TabBarItemButton alloc] initWithFrame:CGRectMake(ITEMWIDTH*4, 0, ITEMWIDTH, self.height) title:@"我" normalImage:[UIImage imageNamed:@"me_normal"] highlightImage:[UIImage imageNamed:@"me_selected"]];
            [_centerItem bk_whenTapped:^{
                [blockSelf itemCliceked:4];
            }];
            [self addSubview:_centerItem];
        }
    }
    return self;
}



- (void)itemCliceked:(NSInteger)index{
    self.currentIndex = index;
    if (self.itemIndex) {
        self.itemIndex(index);
    }
}

@end

//
//  TimelineBottomButton.m
//  FC
//
//  Created by ZhangPeng on 15/9/21.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "TimelineBottomButton.h"

@implementation TimelineBottomButton

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_myImageView) {
            _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
            _myImageView.layer.masksToBounds = YES;
            [_myImageView setContentMode:UIViewContentModeCenter];
            [self addSubview:_myImageView];
        }
        if (!_myTextLabel) {
            _myTextLabel = [UILabel labelWithFrame:CGRectMake(_myImageView.right+5, 0, frame.size.width-_myImageView.right-5, frame.size.height) font:[UIFont systemFontOfSize:kLabelSmallFont] textColor:[UIColor darkGrayColor] textAlignment:NSTextAlignmentLeft];
            [self addSubview:_myTextLabel];
        }
    }
    return self;
}

@end

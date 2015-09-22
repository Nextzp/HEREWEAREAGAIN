//
//  TimelineMediaCell.m
//  FC
//
//  Created by ZhangPeng on 15/9/22.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "TimelineMediaCell.h"

@implementation TimelineMediaCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_myImgView) {
            _myImgView = [[UITapImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _myImgView.layer.masksToBounds = YES;
            [_myImgView setContentMode:UIViewContentModeScaleAspectFill];
            [self.contentView addSubview:_myImgView];
        }
    }
    return self;
}
@end

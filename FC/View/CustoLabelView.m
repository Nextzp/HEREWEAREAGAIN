//
//  CustoLabelView.m
//  FC
//
//  Created by ZhangPeng on 15/9/24.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "CustoLabelView.h"

@implementation CustoLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_imgView) {
            _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
            _imgView.layer.masksToBounds = YES;
            [_imgView setContentMode:UIViewContentModeCenter];
            [self addSubview:_imgView];
        }
        if (!_textLabel) {
            _textLabel = [UILabel labelWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
            [self addSubview:self.textLabel];
        }
    }
    return self;
}

- (void)setTitleString:(NSString *)str{
    [self.textLabel setText:str];
    self.textLabel.width = [str getWidthWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(kScreen_Width, self.textLabel.height)];
    self.textLabel.centerX = self.centerX+5;
    self.imgView.right = self.textLabel.left;
}

@end

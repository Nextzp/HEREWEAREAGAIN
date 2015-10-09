//
//  UserCenterHeadView.m
//  FC
//
//  Created by ZhangPeng on 15/9/24.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "UserCenterHeadView.h"
#import <NYXImagesKit/UIImage+Resizing.h>
#import <UIImage+BlurredFrame/UIImage+BlurredFrame.h>

@implementation UserCenterHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_bgImageView) {
            _bgImageView = [[UITapImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            _bgImageView.layer.masksToBounds = YES;
            UIImage *bgImage = [UIImage imageNamed:@"headBgImage.jpeg"];
            [_bgImageView setBackgroundColor:[UIColor colorWithHexString:kAPPMainColorStr]];

            CGSize bgImageSize = bgImage.size, bgViewSize = _bgImageView.frame.size;
            if (bgImageSize.width > bgViewSize.width && bgImageSize.height > bgViewSize.height) {
                bgImage = [bgImage scaleToSize:bgViewSize usingMode:NYXResizeModeAspectFill];
            }
            bgImage = [bgImage applyBlurWithRadius:0.3 tintColor:[UIColor colorWithWhite:1.0 alpha:0.1] saturationDeltaFactor:8 maskImage:nil atFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
//            _bgImageView.image = bgImage;
            //黑色遮罩
//            UIColor *blackColor = [UIColor blackColor];
//            [_bgImageView addGradientLayerWithColors:@[(id)[blackColor colorWithAlphaComponent:0.4].CGColor,
//                                                 (id)[blackColor colorWithAlphaComponent:0.5].CGColor]
//                                     locations:nil
//                                    startPoint:CGPointMake(0.5, 0.0) endPoint:CGPointMake(0.5, 1.0)];
            [_bgImageView setContentMode:UIViewContentModeScaleAspectFill];
            [self addSubview:_bgImageView];
        }
        if (!_headImgView) {
            _headImgView = [[UITapImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-40, self.frame.size.height/4, 80, 80)];
            _headImgView.layer.cornerRadius = 40;
            _headImgView.layer.borderWidth = 1;
            _headImgView.layer.borderColor = [[UIColor whiteColor] CGColor];
            _headImgView.layer.masksToBounds = YES;
            [_headImgView setContentMode:UIViewContentModeScaleAspectFill];
            [self addSubview:_headImgView];
        }
        if (!_nameLabel) {
            _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _headImgView.bottom+5, self.frame.size.width, 25)];
            _nameLabel.textAlignment = NSTextAlignmentCenter;
            _nameLabel.font = [UIFont boldSystemFontOfSize:16];
            _nameLabel.text = @"Braspring";
            _nameLabel.textColor = [UIColor whiteColor];
            [self addSubview:_nameLabel];
        }
        if (!_addressView) {
            _addressView = [[CustoLabelView alloc] initWithFrame:CGRectMake(0, _nameLabel.bottom+5, self.frame.size.width, 25)];
            [self addSubview:_addressView];
        }
        
        UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-60, self.frame.size.width, 60)];
        alphaView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.1];
        [self addSubview:alphaView];
        
        if (!_followCountLabel) {
            _followCountLabel = [UILabel labelWithFrame:CGRectMake(0, self.frame.size.height-60, self.frame.size.width/2, 40) font:[UIFont boldSystemFontOfSize:20] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
            _followCountLabel.text = @"0";
            [self addSubview:_followCountLabel];
        }
        
        if (!_fansCountLabel) {
            _fansCountLabel = [UILabel labelWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height-60, self.frame.size.width/2, 40) font:[UIFont boldSystemFontOfSize:20] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
            _fansCountLabel.text = @"0";
            [self addSubview:_fansCountLabel];
        }
        
        UILabel *follow = [UILabel labelWithFrame:CGRectMake(0, _followCountLabel.bottom, _followCountLabel.width, 20) font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        follow.text = @"关注";
        [self addSubview:follow];
        UILabel *fans = [UILabel labelWithFrame:CGRectMake(_fansCountLabel.left, _fansCountLabel.bottom, _fansCountLabel.width, 20) font:[UIFont systemFontOfSize:12] textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        fans.text = @"粉丝";
        [self addSubview:fans];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2, self.frame.size.height-55, 0.7, 50)];
        lineView.backgroundColor = RGBA(230, 230, 230, 0.2);
        [self addSubview:lineView];
    }
    return self;
}

@end

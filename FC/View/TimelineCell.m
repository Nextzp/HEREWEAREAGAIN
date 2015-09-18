//
//  TimelineCell.m
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "TimelineCell.h"

@interface TimelineCell()<TTTAttributedLabelDelegate>

@property (nonatomic, strong) UITapImageView        *headImageView;
@property (nonatomic, strong) UILabel               *nameLabel;
@property (nonatomic, strong) UILabel               *timeLabel;
@property (nonatomic, strong) UITTTAttributedLabel  *contentLabel;

@end

@implementation TimelineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        WeakSelfType blockSelf = self;
        if (!self.headImageView) {
            _headImageView = ({
                UITapImageView *imgView = [[UITapImageView alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, 5, 35, 35)];
                [imgView doCircleFrame];
                [self.contentView addSubview:imgView];
                imgView;
            });
        }
        if (!self.nameLabel) {
            _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImageView.right+kPaddingLeftWidth, 5, kScreen_Width, 20)];
            _nameLabel.userInteractionEnabled = YES;
            [_nameLabel setTextColor:[UIColor redColor]];
            [_nameLabel setFont:[UIFont systemFontOfSize:kLabelBigFont]];
            [_nameLabel bk_whenTapped:^{
                
            }];
            [self.contentView addSubview:self.nameLabel];
        }
        if (!self.contentLabel) {
            self.contentLabel = [[UITTTAttributedLabel alloc] initWithFrame:CGRectMake(self.nameLabel.left, self.nameLabel.bottom, kScreen_Width-self.nameLabel.left-5, 20)];
            self.contentLabel.font = [UIFont systemFontOfSize:kLabelSmallFont];
            self.contentLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            self.contentLabel.numberOfLines = 0;
            self.contentLabel.linkAttributes = kLinkAttributes;
            self.contentLabel.activeLinkAttributes = kLinkAttributesActive;
            self.contentLabel.delegate = self;
            [self.contentLabel addLongPressForCopy];
            [self.contentView addSubview:self.contentLabel];
        }
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (!self.timeline) {
        return;
    }
    WeakSelfType blockSelf = self;
    [self.headImageView setImageWithUrl:self.timeline.userIconUrl placeholderImage:kPlaceholderLogoRoundView(self.headImageView) tapBlock:^(id obj) {
        [blockSelf userBtnClicked];
    }];
    [self.nameLabel setText:self.timeline.userNickName];
    [self.contentLabel setText:self.timeline.content];
}

- (void)userBtnClicked{
    
}

@end

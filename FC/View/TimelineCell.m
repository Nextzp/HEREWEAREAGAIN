//
//  TimelineCell.m
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#define kTimelineCell_ContentWidth kScreen_Width - (kPaddingLeftWidth*2+35+5)
#define kTimeline_ContentMaxHeight 200.0

#import "TimelineCell.h"
#import "NSDate+Common.h"
#import "TimelineBottomButton.h"

@interface TimelineCell()<TTTAttributedLabelDelegate>

@property (nonatomic, strong) UITapImageView        *headImageView;
@property (nonatomic, strong) UILabel               *nameLabel;
@property (nonatomic, strong) UILabel               *timeLabel;
@property (nonatomic, strong) UITTTAttributedLabel  *contentLabel;
@property (nonatomic, strong) UIView                *contentBgView;

@property (nonatomic, strong) TimelineBottomButton  *likeButton;
@property (nonatomic, strong) TimelineBottomButton  *commentButton;


@end

@implementation TimelineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (!_contentBgView) {
            _contentBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, kScreen_Width, 100)];
            [_contentBgView setBackgroundColor:[UIColor whiteColor]];
            [_contentBgView.layer setBorderColor:[kAppMainBackgroundColor CGColor]];
            [_contentBgView.layer setBorderWidth:0.5];
            [self.contentView addSubview:self.contentBgView];
        }
        if (!self.headImageView) {
            _headImageView = ({
                UITapImageView *imgView = [[UITapImageView alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, 10, 35, 35)];
                [imgView doCircleFrame];
                [self.contentBgView addSubview:imgView];
                imgView;
            });
        }
        if (!self.nameLabel) {
            _nameLabel = [UILabel labelWithFrame:CGRectMake(self.headImageView.right+kPaddingLeftWidth, 10, kScreen_Width, 20) font:[UIFont systemFontOfSize:kLabelBigFont] textColor:[UIColor darkGrayColor] textAlignment:NSTextAlignmentLeft];
            _nameLabel.userInteractionEnabled = YES;
            [_nameLabel bk_whenTapped:^{
                
            }];
            [self.contentBgView addSubview:self.nameLabel];
        }
        if (!_timeLabel) {
            _timeLabel = [UILabel labelWithFrame:CGRectMake(kScreen_Width-100, _nameLabel.top, 95, 20) font:[UIFont systemFontOfSize:kLabelSmallFont] textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentRight];
            [self.contentBgView addSubview:_timeLabel];
        }
        if (!self.contentLabel) {
            self.contentLabel = [[UITTTAttributedLabel alloc] initWithFrame:CGRectMake(self.nameLabel.left, self.nameLabel.bottom+5, kScreen_Width-self.nameLabel.left-5, 20)];
            self.contentLabel.font = [UIFont systemFontOfSize:kLabelSmallFont];
            self.contentLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            self.contentLabel.numberOfLines = 0;
            self.contentLabel.linkAttributes = kLinkAttributes;
            self.contentLabel.activeLinkAttributes = kLinkAttributesActive;
            self.contentLabel.delegate = self;
            [self.contentLabel addLongPressForCopy];
            [self.contentBgView addSubview:self.contentLabel];
        }
        if (!_commentButton) {
            _commentButton = [[TimelineBottomButton alloc] initWithFrame:CGRectMake(self.nameLabel.left, self.contentLabel.bottom+5, (kTimelineCell_ContentWidth)/2, 30)];
            [_commentButton.myImageView setImage:[UIImage imageNamed:@"timeline_icon_like"]];
            [_commentButton.myTextLabel setText:@"0"];
            [self.contentView addSubview:_commentButton];
        }
        if (!_likeButton) {
            _likeButton = [[TimelineBottomButton alloc] initWithFrame:CGRectMake(_commentButton.right, self.contentLabel.bottom+5, (kTimelineCell_ContentWidth)/2, 30)];
            [_likeButton.myImageView setImage:[UIImage imageNamed:@"topic_comment_icon"]];
            [_likeButton.myTextLabel setText:@"0"];
            [self.contentView addSubview:_likeButton];
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
    [self.commentButton.myTextLabel setText:[NSString unitWithNumber:[NSString stringWithFormat:@"%@",self.timeline.commentCount]]];
    [self.likeButton.myTextLabel setText:[NSString unitWithNumber:[NSString stringWithFormat:@"%@",self.timeline.likeCount]]];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self.timeline.createTime longLongValue]];
    [self.timeLabel setText:[date stringDisplay_MMdd]];
    
    [self.contentLabel setLongString:self.timeline.content withFitWidth:kTimelineCell_ContentWidth maxHeight:kTimeline_ContentMaxHeight];
    
    
    //从新设置视图位置
    self.contentBgView.height = [TimelineCell cellHeightWithObj:self.timeline]-5;
    self.commentButton.top = self.contentLabel.bottom+10;
    self.likeButton.top = self.contentLabel.bottom+10;
}

+ (CGFloat)cellHeightWithObj:(id)obj{
    Timeline *timeline = (Timeline *)obj;
    CGFloat cellHeight = 0;
    cellHeight += 30;
    cellHeight += [self contentLabelHeightWithTweet:timeline];
    cellHeight += 30;
    return cellHeight;
}

+ (CGFloat)contentLabelHeightWithTweet:(Timeline *)timeline{
    CGFloat height = 0;
    if (timeline.content.length > 0) {
        height += MIN(kTimeline_ContentMaxHeight, [timeline.content getHeightWithFont:[UIFont systemFontOfSize:kLabelSmallFont] constrainedToSize:CGSizeMake(kTimelineCell_ContentWidth, CGFLOAT_MAX)]);
        height += 15;
    }
    return height;
}

- (void)userBtnClicked{
    
}

@end

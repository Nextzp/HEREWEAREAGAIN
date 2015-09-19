//
//  BaseCell.m
//  FC
//
//  Created by ZhangPeng on 15/9/20.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView setBackgroundColor:kAppMainBackgroundColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

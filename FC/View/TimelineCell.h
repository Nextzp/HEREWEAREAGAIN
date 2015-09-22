//
//  TimelineCell.h
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#define kCellIdentifier_TimelineCell @"TimelineCell"

#import "BaseCell.h"
#import "Timeline.h"

@interface TimelineCell : BaseCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) Timeline *timeline;

+ (CGFloat)cellHeightWithObj:(id)obj;

@end

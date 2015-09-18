//
//  TimelineCell.h
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#define kCellIdentifier_TimelineCell @"TimelineCell"

#import <UIKit/UIKit.h>
#import "Timeline.h"

@interface TimelineCell : UITableViewCell

@property (strong, nonatomic) Timeline *timeline;

@end

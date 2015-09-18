//
//  TimelineSendViewController.h
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "BaseViewController.h"
#import "Timeline.h"

@interface TimelineSendViewController : BaseViewController

@property (nonatomic, copy) void (^sendNextTimeline)(Timeline *timeline);

@end

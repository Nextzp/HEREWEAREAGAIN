//
//  Timeline.m
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "Timeline.h"

@implementation Timeline

- (instancetype)init
{
    self = [super init];
    if (self) {
        _propertyArrayMap = [NSDictionary dictionaryWithObjectsAndKeys:@"pics",@"pics", nil];
    }
    return self;
}

@end

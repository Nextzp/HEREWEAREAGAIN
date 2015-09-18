//
//  FC_NetAPIManager.h
//  FC
//
//  Created by ZhangPeng on 15/9/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FC_NetAPIManager : NSObject

+ (instancetype)sharedManager;

//friend
- (void)request_TimelineDataWithParams:(id)params andBlock:(void (^)(id data, NSError *error))block;

@end

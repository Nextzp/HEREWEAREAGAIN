//
//  Timeline.h
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timeline : NSObject

@property (strong, nonatomic) NSNumber *timelineId;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSNumber *createTime;
@property (strong, nonatomic) NSDictionary *propertyArrayMap;
@property (strong, nonatomic) NSArray  *pics;
@property (strong, nonatomic) NSString *userIconUrl;
@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSNumber *commentCount;
@property (strong, nonatomic) NSNumber *likeCount;
@property (strong, nonatomic) NSString *userNickName;

@end

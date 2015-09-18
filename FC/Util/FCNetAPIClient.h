//
//  FCNetAPIClient.h
//  FC
//
//  Created by ZhangPeng on 15/9/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"

typedef enum{
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;

@interface FCNetAPIClient : AFHTTPRequestOperationManager

+ (id)sharedJsonClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlcok:(void (^)(id data, NSError *error))block;

@end

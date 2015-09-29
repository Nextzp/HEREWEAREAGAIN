//
//  FC_NetAPIManager.m
//  FC
//
//  Created by ZhangPeng on 15/9/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "FC_NetAPIManager.h"
#import "FCNetAPIClient.h"

@implementation FC_NetAPIManager

+ (instancetype)sharedManager{
    static FC_NetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

- (void)request_TimelineDataWithParams:(id)params andBlock:(void (^)(id, NSError *))block{
    NSString *path = @"/auth/register";
    [[FCNetAPIClient sharedJsonClient] requestJsonDataWithPath:path
                                                    withParams:params
                                                withMethodType:Post
                                                 autoShowError:YES
                                                      andBlcok:^(id data, NSError *error) {
                                                          if (data) {
                                                              id resultData = [data valueForKeyPath:@"data"];
                                                              NSArray *resultA = [NSObject arrayFromJSON:resultData ofObjects:@"Timeline"];
                                                              block(resultA, nil);
                                                          }else{
                                                              block(nil, error);
                                                          }
    }];
    
}

@end

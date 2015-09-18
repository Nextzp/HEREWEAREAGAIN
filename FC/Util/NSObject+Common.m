//
//  NSObject+Common.m
//  FC
//
//  Created by ZhangPeng on 15/9/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "NSObject+Common.h"

@implementation NSObject(Common)

#pragma mark - Tip Method

- (NSString *)tipFromError:(NSError *)error{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if ([error.userInfo objectForKey:@"msg"]) {
            NSArray *msgArray = [[error.userInfo objectForKey:@"msg"] allValues];
            NSUInteger num = [msgArray count];
            for (int i = 0; i < num; i++) {
                NSString *msgStr = [msgArray objectAtIndex:i];
                if (i+1 < num) {
                    [tipStr appendString:[NSString stringWithFormat:@"%@\n",msgStr]];
                }else{
                    [tipStr appendString:msgStr];
                }
            }
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode%ld",(long)error.code];
            }
        }
        return tipStr;
    }
    return nil;
}

#pragma mark - BaseUrl

+ (NSString *)baseURLStr{
    NSString *baseURLStr;
    baseURLStr = @"http://localhost:9000";
    return baseURLStr;
}

#pragma mark - NetError

- (id)handleResponse:(id)responseJSON{
    return [self handleResponse:responseJSON autoShowError:YES];
}

- (id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError{
    NSError *error = nil;
    //code为非0值时，表示有错
    NSNumber *resultCode = [responseJSON valueForKeyPath:@"code"];
    
    if (resultCode.intValue != 0) {
        error = [NSError errorWithDomain:[NSObject baseURLStr] code:resultCode.intValue userInfo:responseJSON];
        
        if (resultCode.intValue == 1000 || resultCode.intValue == 2000) { //用户未登录
            //TODO::对用户登录信息清除
            //改变appdelegate的rootController
            kTipAlert(@"%@",[self tipFromError:error]);
        }
    }else{
        if (autoShowError) {
//            [self showError:error];
        }
    }
    return error;
}

@end

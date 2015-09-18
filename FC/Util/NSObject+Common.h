//
//  NSObject+Common.h
//  FC
//
//  Created by ZhangPeng on 15/9/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Common)

#pragma mark - Tip Method
- (NSString *)tipFromError:(NSError *)error;
- (BOOL)showError:(NSError *)error;
- (void)showHudTipStr:(NSString *)tipStr;
- (void)showStatusBarQueryStr:(NSString *)tipStr;
- (void)showStatusBarSuccessStr:(NSString *)tipStr;
- (void)showStatusBarErrorStr:(NSString *)tipStr;
- (void)showStatusBarError:(NSError *)error;
- (void)showStatusBarProgress:(CGFloat)progress;
- (void)hideStatusBarProgress;

#pragma mark - BaseUrl
+ (NSString *)baseURLStr;

#pragma mark - NetError
- (id)handleResponse:(id)responseJSON;
- (id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError;

@end

//
//  NSObject+Common.m
//  FC
//
//  Created by ZhangPeng on 15/9/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "NSObject+Common.h"
#import "JDStatusBarNotification.h"
#import "MBProgressHUD+Add.h"

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

- (BOOL)showError:(NSError *)error{
    if ([JDStatusBarNotification isVisible]) {//如果statusBar上面正在显示信息，则不再用hud显示error
        NSLog(@"如果statusBar上面正在显示信息，则不再用hud显示error");
        return NO;
    }
    NSString *tipStr = [self tipFromError:error];
    [self showHudTipStr:tipStr];
    return YES;
}
- (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kKeyWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
        hud.detailsLabelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.0];
    }
}
- (void)showStatusBarQueryStr:(NSString *)tipStr{
    [JDStatusBarNotification showWithStatus:tipStr styleName:JDStatusBarStyleSuccess];
    [JDStatusBarNotification showActivityIndicator:YES indicatorStyle:UIActivityIndicatorViewStyleWhite];
}
- (void)showStatusBarErrorStr:(NSString *)tipStr{
    [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
    [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.5 styleName:JDStatusBarStyleError];
}
- (void)showStatusBarSuccessStr:(NSString *)tipStr{
    if ([JDStatusBarNotification isVisible]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
            [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.5 styleName:JDStatusBarStyleSuccess];
        });
    }else{
        [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
        [JDStatusBarNotification showWithStatus:tipStr dismissAfter:1.5 styleName:JDStatusBarStyleSuccess];
    }
}
- (void)showStatusBarError:(NSError *)error{
    if ([JDStatusBarNotification isVisible]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
            [JDStatusBarNotification showWithStatus:[self tipFromError:error] dismissAfter:1.5 styleName:JDStatusBarStyleError];
        });
    }else{
        [JDStatusBarNotification showActivityIndicator:NO indicatorStyle:UIActivityIndicatorViewStyleWhite];
        [JDStatusBarNotification showWithStatus:[self tipFromError:error] dismissAfter:1.5 styleName:JDStatusBarStyleError];
    }
}
- (void)showStatusBarProgress:(CGFloat)progress{
    [JDStatusBarNotification showProgress:progress];
    
}
- (void)hideStatusBarProgress{
    [JDStatusBarNotification showProgress:0.0];
}

#pragma mark - BaseUrl

+ (NSString *)baseURLStr{
    NSString *baseURLStr;
    baseURLStr = @"http://120.55.190.154:3001";
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

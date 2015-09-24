//
//  Login.h
//  FC
//
//  Created by ZhangPeng on 15/9/23.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject

@property (strong, nonatomic) NSString *phoneNumber;            //注册电话号码
@property (strong, nonatomic) NSString *nickName;               //昵称
@property (strong, nonatomic) NSString *headImageUrl;           //头像地址
@property (strong, nonatomic) NSString *address;                //用户所在地
@property (strong, nonatomic) NSString *phoneType;              //手机类型
@property (strong, nonatomic) NSNumber *gender;                 //性别
@property (strong, nonatomic) NSString *fansCount;              //粉丝数量
@property (strong, nonatomic) NSString *followCount;            //关注数量
@property (strong, nonatomic) NSString *latitude;               //纬度
@property (strong, nonatomic) NSString *longitude;              //经度

+ (BOOL)isLogin;

@end

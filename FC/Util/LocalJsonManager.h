//
//  LocalJsonManager.h
//  FC
//
//  Created by ZhangPeng on 15/9/20.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalJsonManager : NSObject

+ (instancetype)sharedManager;

- (id)loadLocalJsonDataWithFileName:(NSString *)name Type:(NSString *)type;

@end

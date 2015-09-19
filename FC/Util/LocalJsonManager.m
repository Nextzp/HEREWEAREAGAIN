//
//  LocalJsonManager.m
//  FC
//
//  Created by ZhangPeng on 15/9/20.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "LocalJsonManager.h"

@implementation LocalJsonManager

+ (instancetype)sharedManager{
    static LocalJsonManager *shared_Manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_Manager = [[self alloc] init];
    });
    return shared_Manager;
}

- (id)loadLocalJsonDataWithFileName:(NSString *)name Type:(NSString *)type{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSError *error = nil;
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    if (error) {
        DebugLog(@"address.json - fail: %@", error.description);
        return nil;
    }else{
        return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    }
}

@end

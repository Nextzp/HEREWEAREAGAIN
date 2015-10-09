//
//  AppDelegate.m
//  FC
//
//  Created by ZhangPeng on 15/9/8.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "AppDelegate.h"
#import "Root_TabBarController.h"
#import "LoginViewController.h"
#import <SMS_SDK/SMS_SDK.h>

#define SMSAppKey       @"ad8df80a6df4"
#define SMSAppSecret    @"173d4e55f517942a2755557a8a7f3d90"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self setupLoginViewController];
    [self getUserLocation];
    
    [self setAppDefaultUI];
    [self registerSMS]; //注册短信业务
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)getUserLocation{
    self.locationMgr = [[CLLocationManager alloc] init];
    //设置代理
    self.locationMgr.delegate = self;
    
    // 设置定位精度
    // kCLLocationAccuracyNearestTenMeters:精度10米
    // kCLLocationAccuracyHundredMeters:精度100 米
    // kCLLocationAccuracyKilometer:精度1000 米
    // kCLLocationAccuracyThreeKilometers:精度3000米
    // kCLLocationAccuracyBest:设备使用电池供电时候最高的精度
    // kCLLocationAccuracyBestForNavigation:导航情况下最高精度，一般要有外接电源时才能使用
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    
    // distanceFilter是距离过滤器，为了减少对定位装置的轮询次数，位置的改变不会每次都去通知委托，而是在移动了足够的距离时才通知委托程序
    // 它的单位是米，这里设置为至少移动1000再通知委托处理更新;
    self.locationMgr.distanceFilter = 1000.0f;
    
    //开始定位
    [self.locationMgr requestAlwaysAuthorization];
    [self.locationMgr startUpdatingLocation];
}

//设置app默认样式
- (void)setAppDefaultUI{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

// iso 6.0以上SDK版本使用，包括6.0。
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *cl = [locations objectAtIndex:0];
    NSLog(@"纬度--%f",cl.coordinate.latitude);
    NSLog(@"经度--%f",cl.coordinate.longitude);
    
}


//获取定位失败回调方法
#pragma mark - location Delegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位错误");
}

- (void)setupLoginViewController{
    LoginViewController *vc = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window setRootViewController:nav];
}

- (void)setupTabViewController{
    Root_TabBarController *vc = [[Root_TabBarController alloc] init];
    self.window.rootViewController = vc;
}

#pragma mark - SMS
- (void)registerSMS{
    [SMS_SDK registerApp:SMSAppKey withSecret:SMSAppSecret];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

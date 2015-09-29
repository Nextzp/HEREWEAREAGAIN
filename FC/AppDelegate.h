//
//  AppDelegate.h
//  FC
//
//  Created by ZhangPeng on 15/9/8.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>{
   
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) CLLocationManager* locationMgr;
@property (nonatomic, retain) CLGeocoder* clGeocoder;// iso 5.0及5.0以上SDK版本使


@end


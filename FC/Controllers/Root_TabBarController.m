//
//  Root_TabBarController.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "Root_TabBarController.h"
#import "CustomTabBarView.h"
#import "Root_FriendViewController.h"
#import "Root_ShareViewController.h"
#import "Root_RecordViewController.h"
#import "Root_CenterViewController.h"

@interface Root_TabBarController ()

@property (strong, nonatomic) CustomTabBarView *customTabBarView;

@end

@implementation Root_TabBarController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self.tabBar setHidden:YES];
        WeakSelfType blcokSelf = self;
        UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height-46, kScreen_Width, 46)];
        [alphaView setBackgroundColor:[UIColor whiteColor]];
        [alphaView setAlpha:0.95];
        self.customTabBarView = [[CustomTabBarView alloc] initWithFrame:CGRectMake(0, kScreen_Height-46, kScreen_Width, 46)];
        [self.customTabBarView setItemIndex:^(NSInteger itemIndex) {
            NSLog(@"%ld",(long)itemIndex);
            if (itemIndex != 2) {
                [blcokSelf setSelectedIndex:itemIndex];
            }else{
                
            }
        }];
        [self.view addSubview:alphaView];
        [self.view addSubview:self.customTabBarView];
        [self controlersInitialize];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private M

//Create TabBarController viewControllers
- (void)controlersInitialize{
    Root_FriendViewController  *friendVc  = [[Root_FriendViewController alloc] init];
    Root_ShareViewController   *shareVc   = [[Root_ShareViewController alloc] init];
    BaseViewController         *baseVc    = [[BaseViewController alloc] init]; //只是一个占位controller
    Root_RecordViewController  *recordVc  = [[Root_RecordViewController alloc] init];
    Root_CenterViewController  *centerVc  = [[Root_CenterViewController alloc] init];
    
    UINavigationController     *friendNav = [[UINavigationController alloc] initWithRootViewController:friendVc];
    UINavigationController     *shareNav  = [[UINavigationController alloc] initWithRootViewController:shareVc];
    UINavigationController     *baseNav   = [[UINavigationController alloc] initWithRootViewController:baseVc];
    UINavigationController     *recordNav = [[UINavigationController alloc] initWithRootViewController:recordVc];
    UINavigationController     *centerNav = [[UINavigationController alloc] initWithRootViewController:centerVc];
    
    [friendNav  setNavigationBarHidden:YES];
    [shareNav   setNavigationBarHidden:YES];
    [baseNav    setNavigationBarHidden:YES];
    [recordNav  setNavigationBarHidden:YES];
    [centerNav  setNavigationBarHidden:YES];
    
    self.viewControllers = @[friendNav, shareNav, baseNav, recordNav, centerNav];
}

@end

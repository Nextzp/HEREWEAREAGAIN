//
//  BaseViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/8.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:kAppMainBackgroundColor];
    
    self.navBarView = [[CustomNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 64)];
    [self.view addSubview:self.navBarView];
    
    [self.navBarView.backBtn addTarget:self action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)popBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

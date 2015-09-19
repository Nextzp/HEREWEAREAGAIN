//
//  Root_RecordViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "Root_RecordViewController.h"

@interface Root_RecordViewController ()

@end

@implementation Root_RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navBarView hiddenBackButton:YES];
    [self.navBarView.navTitleLabel setText:@"足迹"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

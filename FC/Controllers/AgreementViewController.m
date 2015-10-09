//
//  AgreementViewController.m
//  FC
//
//  Created by 张朋 on 15/9/30.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "AgreementViewController.h"

@interface AgreementViewController ()

@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navBarView.navTitleLabel setText:@"足球分享协议"];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height-64)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"agreement" ofType:@"html"]]]];
    [self.view addSubview:webView];
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

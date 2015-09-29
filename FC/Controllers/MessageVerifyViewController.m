//
//  MessageVerifyViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/29.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "MessageVerifyViewController.h"

@interface MessageVerifyViewController ()

@property (strong, nonatomic) NSString *mobilePhone;

@end

@implementation MessageVerifyViewController

- (instancetype)initWithRegisterMobilePhone:(NSString *)phone{
    self = [super init];
    if (self) {
        self.mobilePhone = phone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navBarView.navTitleLabel setText:@"短信验证"];
    UILabel *hintLabel = [UILabel labelWithFrame:CGRectMake(0, 100, kScreen_Width, 32) font:[UIFont systemFontOfSize:14] textColor:[UIColor darkGrayColor] textAlignment:NSTextAlignmentCenter];
    hintLabel.text = [NSString stringWithFormat:@"短信验证码已发送到  %@",self.mobilePhone];
    [self.view addSubview:hintLabel];
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

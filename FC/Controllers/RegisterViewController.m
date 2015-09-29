//
//  RegisterViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/28.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "RegisterViewController.h"
#import "MessageVerifyViewController.h"

@interface RegisterViewController ()

@property (strong, nonatomic) UITextField *usernameTextField;
@property (strong, nonatomic) UITextField *passwordTextField;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navBarView.navTitleLabel setText:@"注册"];
    
    if (!self.usernameTextField) {
        self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(kScreen_Width/2-125, 100, 250, 32)];
        [self.usernameTextField setPlaceholder:@"手机"];
        [self.usernameTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [self.usernameTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.usernameTextField setFont:[UIFont systemFontOfSize:14]];
        [self.usernameTextField setTextColor:[UIColor darkGrayColor]];
        [self.view addSubview:self.usernameTextField];
        [self.usernameTextField becomeFirstResponder];
    }
    if (!self.passwordTextField) {
        self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(kScreen_Width/2-125, 140, 250, 32)];
        [self.passwordTextField setPlaceholder:@"密码"];
        [self.passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.passwordTextField setFont:[UIFont systemFontOfSize:14]];
        [self.passwordTextField setTextColor:[UIColor darkGrayColor]];
        [self.view addSubview:self.passwordTextField];
    }
    
    UIButton *registerBtn = [UIButton buttonWithStyle:StrapDefaultStyle andTitle:@"注册" andFrame:CGRectMake(kScreen_Width/2-125, 190, 250, 32) target:self action:@selector(registerAction:)];
    [registerBtn mainStyle];
    [self.view addSubview:registerBtn];
    
    UILabel *agreementLabel = [UILabel labelWithFrame:CGRectMake(0, kScreen_Height-40, kScreen_Width, 40) font:[UIFont systemFontOfSize:13] textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentCenter];
    [agreementLabel setText:@"注册即表示同意《协议》"];
    [self.view addSubview:agreementLabel];
}

- (void)registerAction:(id)sender{
    MessageVerifyViewController *vc = [[MessageVerifyViewController alloc] initWithRegisterMobilePhone:self.usernameTextField.text];
    [self.navigationController pushViewController:vc animated:YES];
}

// verify input phonenumber
- (void)verifyMobilePhone{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
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

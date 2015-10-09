//
//  RegisterViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/28.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "RegisterViewController.h"
#import "MessageVerifyViewController.h"
#import "AgreementViewController.h"

@interface RegisterViewController ()<TTTAttributedLabelDelegate>

@property (strong, nonatomic) UITextField *usernameTextField;
@property (strong, nonatomic) UITextField *passwordTextField;

@end

@implementation RegisterViewController

- (void)viewWillDisappear:(BOOL)animated{
    [self hideKeyBoard];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navBarView.navTitleLabel setText:@"注册"];
    
    if (!self.usernameTextField) {
        self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(kScreen_Width/2-125, 100, 250, 32)];
        [self.usernameTextField setPlaceholder:@"手机"];
        [self.usernameTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [self.usernameTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.usernameTextField setFont:[UIFont systemFontOfSize:14]];
        [self.usernameTextField setClearsOnBeginEditing:YES];
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
        [self.passwordTextField setClearsOnBeginEditing:YES];
        [self.passwordTextField setSecureTextEntry:YES];
        [self.view addSubview:self.passwordTextField];
    }
    
    UIButton *registerBtn = [UIButton buttonWithStyle:StrapDefaultStyle andTitle:@"注册" andFrame:CGRectMake(kScreen_Width/2-125, 190, 250, 32) target:self action:@selector(registerAction:)];
    [registerBtn mainStyle];
    [self.view addSubview:registerBtn];
    
    UITTTAttributedLabel *agreementLabel = [[UITTTAttributedLabel alloc] initWithFrame:CGRectMake(0, registerBtn.bottom+20, kScreen_Width, 40)];
    [agreementLabel setFont:[UIFont systemFontOfSize:12]];
    [agreementLabel setTextColor:[UIColor lightGrayColor]];
    [agreementLabel setTextAlignment:NSTextAlignmentCenter];
    [agreementLabel setLinkAttributes:kLinkAttributes];
    [agreementLabel setActiveLinkAttributes:kLinkAttributesActive];
    [agreementLabel setText:@"注册即表示同意《足球分享协议》"];
    [agreementLabel setDelegate:self];
    [agreementLabel addLinkToTransitInformation:@{@"actionStr":@"gotoAgreementVC"} withRange:[agreementLabel.text rangeOfString:@"《足球分享协议》"]];
    [self.view addSubview:agreementLabel];
}

//verify input phonenumber
- (void)registerAction:(id)sender{
    if (self.usernameTextField.text.length == 11 && [NSString isMobileNumberClassification:self.usernameTextField.text]) {
        if (self.passwordTextField.text.length >= 6) {
            MessageVerifyViewController *vc = [[MessageVerifyViewController alloc] initWithRegisterMobilePhone:self.usernameTextField.text];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (self.passwordTextField.text.length == 0){
            [self showStatusBarErrorStr:@"请输入密码"];
        }else{
            [self showStatusBarErrorStr:@"请输入六位有效密码"];
        }
    }else{
        [self showStatusBarErrorStr:@"请输入正确的手机号!"];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideKeyBoard];
}

- (void)hideKeyBoard{
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

// goto agreement controller
- (void)gotoAgreementVC{
    AgreementViewController *vc = [[AgreementViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithTransitInformation:(NSDictionary *)components{
    if ([[components objectForKey:@"actionStr"] isEqualToString:@"gotoAgreementVC"]) {
        [self gotoAgreementVC];
    }
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

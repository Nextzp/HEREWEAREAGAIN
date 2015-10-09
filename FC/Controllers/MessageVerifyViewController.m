//
//  MessageVerifyViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/29.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "MessageVerifyViewController.h"
#import "AppDelegate.h"
#import <SMS_SDK/SMS_SDK.h>
#import "SMS_SDK/CountryAndAreaCode.h"

@interface MessageVerifyViewController ()

@property (strong, nonatomic) NSString *mobilePhone;
@property (strong, nonatomic) UITextField *verifyCodeTextField;
@property (strong, nonatomic) UIButton *reSendBtn, *nextBtn;

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
    UITTTAttributedLabel *hintLabel = [[UITTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 100, kScreen_Width, 32)];
    hintLabel.textAlignment = NSTextAlignmentCenter;
    hintLabel.font = [UIFont systemFontOfSize:kLabelSmallFont];
    hintLabel.textColor = [UIColor darkGrayColor];
    hintLabel.linkAttributes = kLinkAttributes;
    hintLabel.activeLinkAttributes = kLinkAttributesActive;
    hintLabel.text = [NSString stringWithFormat:@"短信验证码已发送到  %@",self.mobilePhone];
    [hintLabel addLinkToTransitInformation:nil withRange:[hintLabel.text rangeOfString:self.mobilePhone]];
    [self.view addSubview:hintLabel];
    
    if (!self.verifyCodeTextField) {
        self.verifyCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(kScreen_Width/2-125, hintLabel.bottom+20, 170, 32)];
        [self.verifyCodeTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [self.verifyCodeTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.verifyCodeTextField setFont:[UIFont systemFontOfSize:kLabelSmallFont]];
        [self.verifyCodeTextField setTextColor:[UIColor darkGrayColor]];
        [self.view addSubview:self.verifyCodeTextField];
    }
    if (!self.reSendBtn) {
        self.reSendBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.verifyCodeTextField.right+10, hintLabel.bottom+20, 70, 32)];
        [self.reSendBtn setTitle:@"重发" forState:UIControlStateNormal];
        [self.reSendBtn infoStyle];
        [self.view addSubview:self.reSendBtn];
    }
    if (!self.nextBtn) {
        self.nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.verifyCodeTextField.left, self.reSendBtn.bottom+10, 250, 32)];
        [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [self.nextBtn mainStyle];
        [self.nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.nextBtn];
    }
    
    [self sendVerifyCode];
}

- (void)sendVerifyCode{
    [SMS_SDK getVerificationCodeBySMSWithPhone:self.mobilePhone
                                          zone:@"86"
                                        result:^(SMS_SDKError *error)
     {
         if (!error){
             [self showStatusBarSuccessStr:@"验证码发送成功"];
         }else{
             UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                             message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                            delegate:self
                                                   cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                   otherButtonTitles:nil, nil];
             [alert show];
         }
     }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.verifyCodeTextField resignFirstResponder];
}

- (void)nextAction:(id)sender{
    [self showStatusBarSuccessStr:@"注册成功"];
    [kAPPDELEGATE setupLoginViewController];
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

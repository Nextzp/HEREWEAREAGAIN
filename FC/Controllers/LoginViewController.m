//
//  LoginViewController.m
//  Barcelona
//
//  Created by 张朋 on 15/8/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"
#import "Input_OnlyText_Cell.h"
#import "RegisterViewController.h"
#import <NYXImagesKit/UIImage+Resizing.h>
#import <UIImage+BlurredFrame/UIImage+BlurredFrame.h>

@interface LoginViewController ()

@property (strong, nonatomic) TPKeyboardAvoidingTableView *myTableView;
@property (strong, nonatomic) UIImageView *iconUserView, *bgBlurredView;
@property (strong, nonatomic) UIButton *loginBtn, *wechatLoginBtn, *weiboLoginBtn;
@property (strong, nonatomic) UIView *bottomView;
@property (strong, nonatomic) UIButton *dismissButton;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myTableView = ({
        TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [tableView registerNib:[UINib nibWithNibName:kCellIdentifier_Input_OnlyText_Cell bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellIdentifier_Input_OnlyText_Cell];
        
        tableView.backgroundView = self.bgBlurredView;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        tableView;
    });
    
    _myTableView.contentInset = UIEdgeInsetsMake(-kHigher_iOS_6_1_DIS(20), 0, 0, 0);
    self.myTableView.tableHeaderView = [self customHeaderView];
    self.myTableView.tableFooterView=[self customFooterView];
    [self configBottomView];
    [self showdismissButton:self.showDismissButton];
}

- (void)showdismissButton:(BOOL)willShow{
    self.dismissButton.hidden = !willShow;
    if (!self.dismissButton && willShow) {
        self.dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 50, 50)];
        [self.dismissButton setImage:[UIImage imageNamed:@"dismissBtn_Nav"] forState:UIControlStateNormal];
        [self.dismissButton addTarget:self action:@selector(dismissButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.dismissButton];
    }
}

#pragma mark - Table view Header Footer
- (UIView *)customHeaderView{
    CGFloat iconUserViewWidth;
    if (kDevice_Is_iPhone6Plus) {
        iconUserViewWidth = 100;
    }else if (kDevice_Is_iPhone6){
        iconUserViewWidth = 90;
    }else{
        iconUserViewWidth = 75;
    }
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3)];
    _iconUserView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, iconUserViewWidth, iconUserViewWidth)];
    _iconUserView.contentMode = UIViewContentModeScaleAspectFit;
    _iconUserView.layer.masksToBounds = YES;
    _iconUserView.layer.cornerRadius = _iconUserView.width/2;
    _iconUserView.layer.borderWidth = 2.0;
    _iconUserView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [headerV addSubview:_iconUserView];
    [_iconUserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(iconUserViewWidth, iconUserViewWidth));
        make.centerX.equalTo(headerV);
        make.centerY.equalTo(headerV).offset(30);
    }];
    
    [_iconUserView setImage:[UIImage imageNamed:@"icon_user_monkey"]];
    return headerV;
}

- (UIView *)customFooterView{
    UIView *footerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 150)];
    _loginBtn = [UIButton buttonWithStyle:StrapDefaultStyle andTitle:@"登录" andFrame:CGRectMake(kLoginPaddingLeftWidth, 20, kScreen_Width-kLoginPaddingLeftWidth*2, 45) target:self action:@selector(sendLogin)];
    [_loginBtn mainStyle];
    [footerV addSubview:_loginBtn];
    
//    RAC(self, loginBtn.enabled) = [RACSignal combineLatest:@[
////                                                             RACObserve(self, myLogin.email),
////                                                             RACObserve(self, myLogin.password),
////                                                             RACObserve(self, myLogin.j_captcha),
////                                                             RACObserve(self, captchaNeeded),
////                                                             RACObserve(self, is2FAUI),
////                                                             RACObserve(self, otpCode)
//                                                             ]
//                                                    reduce:^id(NSString *email,
//                                                               NSString *password,
//                                                               NSString *j_captcha,
//                                                               NSNumber *captchaNeeded,
//                                                               NSNumber *is2FAUI,
//                                                               NSString *otpCode
//                                                                ){
//                                                        if (is2FAUI && is2FAUI.boolValue) {
////                                                            return @(otpCode.length > 0);
////                                                        }else{
////                                                            if ((captchaNeeded && captchaNeeded.boolValue) && (!j_captcha || j_captcha.length <= 0)) {
////                                                                return @(NO);
////                                                            }else{
////                                                                return @((email && email.length > 0) && (password && password.length > 0));
////                                                            }
////                                                        }
//                                                    }];
    
    UIButton *cannotLoginBtn = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.5] forState:UIControlStateHighlighted];
        [button setTitle:@"无法登录?" forState:UIControlStateNormal];
        [footerV addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 30));
            make.centerX.equalTo(footerV);
            make.top.equalTo(_loginBtn.mas_bottom).offset(20);
        }];
        button;
    });
    
    [cannotLoginBtn addTarget:self action:@selector(cannotLoginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return footerV;
}

- (UIImageView *)bgBlurredView{
    if (!_bgBlurredView) {
        //背景图片
        UIImageView *bgView = [[UIImageView alloc] initWithFrame:kScreen_Bounds];
        bgView.contentMode = UIViewContentModeScaleAspectFill;
//        UIImage *bgImage = [[StartImagesManager shareManager] curImage].image;
        UIImage *bgImage = [UIImage imageNamed:@"STARTIMAGE.jpg"];
        
        CGSize bgImageSize = bgImage.size, bgViewSize = bgView.frame.size;
        if (bgImageSize.width > bgViewSize.width && bgImageSize.height > bgViewSize.height) {
            bgImage = [bgImage scaleToSize:bgViewSize usingMode:NYXResizeModeAspectFill];
        }
        bgImage = [bgImage applyLightEffectAtFrame:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
        bgView.image = bgImage;
        //黑色遮罩
        UIColor *blackColor = [UIColor blackColor];
        [bgView addGradientLayerWithColors:@[(id)[blackColor colorWithAlphaComponent:0.3].CGColor,
                                             (id)[blackColor colorWithAlphaComponent:0.3].CGColor]
                                 locations:nil
                                startPoint:CGPointMake(0.5, 0.0) endPoint:CGPointMake(0.5, 1.0)];
        _bgBlurredView = bgView;
    }
    return _bgBlurredView;
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Input_OnlyText_Cell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Input_OnlyText_Cell forIndexPath:indexPath];
    cell.isForLoginVC = YES;
    
    __weak typeof(self) weakSelf = self;
    if (indexPath.row == 0) {
        cell.textField.keyboardType = UIKeyboardTypeEmailAddress;
        [cell configWithPlaceholder:@"手机号码" andValue:@""];
        cell.textValueChangeBlock = ^(NSString *valueStr){
//            weakSelf.inputTipsView.valueStr = valueStr;
//            weakSelf.inputTipsView.active = YES;
//            weakSelf.myLogin.email = valueStr;
            [weakSelf.iconUserView setImage:[UIImage imageNamed:@"icon_user_monkey"]];
        };
        cell.editDidEndBlcok = ^(NSString *textStr){
//            weakSelf.inputTipsView.active = NO;
//            [weakSelf refreshIconUserImage];
        };
    }else if (indexPath.row == 1){
        [cell configWithPlaceholder:@"密码" andValue:@""];
        cell.textField.secureTextEntry = YES;
        cell.textValueChangeBlock = ^(NSString *valueStr){
//            weakSelf.myLogin.password = valueStr;
        };
    }
    return cell;
}

#pragma mark - BottomView
- (void)configBottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_Height-60, kScreen_Width, 60)];
        _bottomView.backgroundColor = [UIColor clearColor];
        UIButton *registerButton = ({
            UIButton *button = [[UIButton alloc]  initWithFrame:CGRectMake(0, 0, 100, 30)];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.5] forState:UIControlStateHighlighted];
            [button setTitle:@"去注册" forState:UIControlStateNormal];
            [_bottomView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100, 300));
                make.center.equalTo(_bottomView);
            }];
            button;
        });
        [registerButton addTarget:self action:@selector(goRegisterVC:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bottomView];
    }
}

#pragma mark Btn Clicked
- (void)sendLogin{
    
}

- (void)cannotLoginBtnClicked:(id)sender{
    
}

- (void)goRegisterVC:(id)sender{
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dismissButtonClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

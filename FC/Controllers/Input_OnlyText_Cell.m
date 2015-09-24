//
//  Input_OnlyText_Cell.m
//  Barcelona
//
//  Created by 张朋 on 15/8/13.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "Input_OnlyText_Cell.h"

@interface Input_OnlyText_Cell(){
    int timelimit;
}

@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation Input_OnlyText_Cell

- (void)awakeFromNib {
    // Initialization code
    _isCaptcha = NO;
    _isForLoginVC = NO;
}

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editDidBegin:(id)sender {
    _lineView.backgroundColor = [UIColor colorWithHexString:@"0xffffff"];
    self.clearButton.hidden = _isForLoginVC? self.textField.text.length <= 0: YES;
}

- (IBAction)editDidEnd:(id)sender {
    _lineView.backgroundColor = [UIColor colorWithHexString:@"0xffffff" andAlpha:0.5];
    self.clearButton.hidden = YES;
    if (self.editDidEndBlcok) {
        self.editDidEndBlcok(self.textField.text);
    }
}

- (void)configWithPlaceholder:(NSString *)phStr andValue:(NSString *)valueStr{
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:phStr? phStr: @"" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:_isForLoginVC? @"0xffffff": @"0x999999" andAlpha:_isForLoginVC? 0.5: 1.0]}];
    self.textField.text = valueStr;
}
- (IBAction)textValueChanged:(id)sender {
    self.clearButton.hidden = _isForLoginVC? self.textField.text.length <= 0: YES;
    if (self.textValueChangeBlock) {
        self.textValueChangeBlock(self.textField.text);
    }
}

- (IBAction)clearBtnClicked:(id)sender {
    self.textField.text = @"";
    [self textValueChanged:nil];
}

#pragma mark - UIView
- (void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = _isForLoginVC? [UIColor clearColor]: [UIColor whiteColor];
    [self.feachCaptcha mainStyle];
    self.feachCaptcha.titleLabel.font = [UIFont systemFontOfSize:15];
    self.textField.font = [UIFont systemFontOfSize:15];
    [self.textField setTintColor:[UIColor colorWithHexString:kAPPMainColorStr]];
    self.textField.textColor = _isForLoginVC? [UIColor whiteColor]: [UIColor colorWithHexString:@"0x222222"];
    if (!_lineView && _isForLoginVC) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(kLoginPaddingLeftWidth, 43.5, kScreen_Width-2*kLoginPaddingLeftWidth, 0.5)];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"0xffffff" andAlpha:0.5];
        [self.contentView addSubview:_lineView];
    }
    if (_isCaptcha) {
        [self.textField setWidth:(kScreen_Width - 4*kLoginPaddingLeftWidth) - (_isForLoginVC? 90 : 70)];
        _feachCaptcha.hidden = NO;
        [_feachCaptcha addTarget:self action:@selector(feachCaptcha:) forControlEvents:UIControlEventTouchUpInside];
//        [self refreshCaptchaImage];
    }else{
        [self.textField setWidth:(kScreen_Width - 2*kLoginPaddingLeftWidth) - (_isForLoginVC? 20:0)];
        _feachCaptcha.hidden = YES;
    }
    [self.clearButton setX:self.textField.maxXOfFrame - 10];
    _lineView.hidden = !_isForLoginVC;
    _clearButton.hidden = YES;
    self.textField.clearButtonMode = _isForLoginVC? UITextFieldViewModeNever: UITextFieldViewModeWhileEditing;
}

/**
 *  获取验证码
 *
 *  @param btn button
 */
- (void)feachCaptcha:(UIButton *)btn{
    _feachCaptcha.enabled = NO;
    _timer =  [NSTimer scheduledTimerWithTimeInterval:1.4 target:self selector:@selector(smsTimelimit:) userInfo:nil repeats:YES];
}

- (void)smsTimelimit:(NSTimer*)timer{
    
    NSString *title = [NSString stringWithFormat:@"重发(%d)",timelimit];
    [_feachCaptcha setTitle:title forState:UIControlStateNormal];
    timelimit--;
    if (timelimit <= 0) {
        if (timer.isValid) {
            [timer invalidate];
            timer = nil;
        }
    }
}
/**
 *  获取验证码图片
 */
//- (void)refreshCaptchaImage{
//    if (_activityIndicator && _activityIndicator.isAnimating) {
//        return;
//    }
//    self.captchaImage = nil;
//    __weak typeof(self) weakSelf = self;
//    [[Coding_NetAPIManager sharedManager] loadImageWithPath:[NSString stringWithFormat:@"%@api/getCaptcha", [NSObject baseURLStr]] completeBlock:^(UIImage *image, NSError *error) {
//        if (image) {
//            weakSelf.captchaImage = image;
//        }else{
//            weakSelf.captchaImage = [UIImage imageNamed:@"captcha_loadfail"];
//        }
//    }];
//}

//- (void)setCaptchaImage:(UIImage *)captchaImage{
//    __weak typeof(self) weakSelf = self;
//    if (!_captchaView) {
//        _captchaView = [[UITapImageView alloc] initWithFrame:CGRectMake(kScreen_Width-60-kLoginPaddingLeftWidth, (44-25)/2, 60, 25)];
//        
//        _captchaView.layer.masksToBounds = YES;
//        _captchaView.layer.cornerRadius = 5;
//        
//        [_captchaView addTapBlock:^(id obj) {
//            [weakSelf refreshCaptchaImage];
//        }];
//        [self.contentView addSubview:_captchaView];
//    }
//    if (captchaImage) {
//        [_activityIndicator stopAnimating];
//        _captchaImage = captchaImage;
//        _captchaView.image = captchaImage;
//    }else{
//        if (!_activityIndicator) {
//            _activityIndicator = [[UIActivityIndicatorView alloc]
//                                  initWithActivityIndicatorStyle:
//                                  UIActivityIndicatorViewStyleGray];
//            CGSize captchaViewSize = _captchaView.bounds.size;
//            _activityIndicator.hidesWhenStopped = YES;
//            [_activityIndicator setCenter:CGPointMake(captchaViewSize.width/2, captchaViewSize.height/2)];
//            [_captchaView addSubview:_activityIndicator];
//        }
//        [_activityIndicator startAnimating];
//    }
//}
//
- (void)prepareForReuse{
    self.isForLoginVC = NO;
    self.isCaptcha = NO;
    self.textField.secureTextEntry = NO;
    self.textField.userInteractionEnabled = YES;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.editDidEndBlcok = nil;
}

@end

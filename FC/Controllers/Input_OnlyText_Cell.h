//
//  Input_OnlyText_Cell.h
//  Barcelona
//
//  Created by 张朋 on 15/8/13.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#define kCellIdentifier_Input_OnlyText_Cell @"Input_OnlyText_Cell"

#import <UIKit/UIKit.h>
#import "UITapImageView.h"

@interface Input_OnlyText_Cell : UITableViewCell

@property (assign, nonatomic) BOOL isCaptcha, isForLoginVC;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UIImage *captchaImage; //验证码图片
@property (strong, nonatomic) UITapImageView *captchaView; //显示验证码图片
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *feachCaptcha;

@property (copy, nonatomic) void(^textValueChangeBlock)(NSString *);
@property (copy, nonatomic) void(^editDidEndBlcok)(NSString *);

- (IBAction)editDidBegin:(id)sender;
- (IBAction)editDidEnd:(id)sender;
- (void)configWithPlaceholder:(NSString *)phStr andValue:(NSString *)valueStr;
- (IBAction)textValueChanged:(id)sender;
- (IBAction)clearBtnClicked:(id)sender;

- (void)refreshCaptchaImage;

@end

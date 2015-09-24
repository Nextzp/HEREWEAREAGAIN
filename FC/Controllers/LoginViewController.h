//
//  LoginViewController.h
//  Barcelona
//
//  Created by 张朋 on 15/8/16.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "BaseViewController.h"
#import "TPKeyboardAvoidingTableView.h"

@interface LoginViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) BOOL  showDismissButton;

@end

//
//  Root_CenterViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#define HeadBackgroundHeight kScreen_Width*0.8

#import "Root_CenterViewController.h"
#import "UserCenterHeadView.h"

@interface Root_CenterViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *myTableView;

@end

@implementation Root_CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBarView.hidden = YES;
    
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-46) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView setBackgroundColor:[UIColor blackColor]];
        [_myTableView setBackgroundView:nil];
        [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UserCenterHeadView *headView = [[UserCenterHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, HeadBackgroundHeight)];
    [headView.headImgView setImage:[UIImage imageNamed:@"coding_emoji_31"]];
    [headView.addressView.imgView setImage:[UIImage imageNamed:@"icon_not_locationed"]];
    [headView.addressView setTitleString:@"四川省 成都市"];
    headView.backgroundColor = [UIColor redColor];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HeadBackgroundHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *celle = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!celle) {
        celle = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    celle.textLabel.text = @"dsf";
    return celle;
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

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
@property (strong, nonatomic) NSArray   *settingArray;

@end

@implementation Root_CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBarView.hidden = YES;
    
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-46) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView setBackgroundColor:[UIColor clearColor]];
        [_myTableView setBackgroundView:nil];
        [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [self.view addSubview:_myTableView];
    }
    
    self.settingArray = @[@[@"我的消息",@"我的好友",@"我的动态",@"我的赞"],@[@"设置"]];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.settingArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UserCenterHeadView *headView = [[UserCenterHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, HeadBackgroundHeight)];
        [headView.headImgView setImage:[UIImage imageNamed:@"head.jpeg"]];
        [headView.addressView.imgView setImage:[UIImage imageNamed:@"icon_not_locationed"]];
        [headView.addressView setTitleString:@"四川省 成都市"];
        headView.backgroundColor = [UIColor redColor];
        return headView;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return HeadBackgroundHeight;
    }else{
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *celle = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!celle) {
        celle = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    celle.textLabel.text = [[self.settingArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
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

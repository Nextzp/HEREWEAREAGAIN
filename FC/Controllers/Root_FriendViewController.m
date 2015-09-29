//
//  Root_FriendViewController.m
//  FC
//
//  Created by ZhangPeng on 15/9/9.
//  Copyright (c) 2015年 Lishan. All rights reserved.
//

#import "Root_FriendViewController.h"
#import "TimelineSendViewController.h"
#import "Timeline.h"
#import "TimelineCell.h"
#import <MJRefresh/MJRefresh.h>

@interface Root_FriendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *timelineArray;
@property (nonatomic, strong) UIButton *publicTimelineBtn;

@end

@implementation Root_FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navBarView hiddenBackButton:YES];
    [self.navBarView.navTitleLabel setText:@"朋友"];
    
    self.timelineArray = [NSMutableArray array];
    
    _publicTimelineBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width-50, 20, 44, 44)];
    [_publicTimelineBtn setImage:[UIImage imageNamed:@"tweetBtn_Nav"] forState:UIControlStateNormal];
    [_publicTimelineBtn addTarget:self action:@selector(publicTimelineAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navBarView addSubview:_publicTimelineBtn];
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreen_Width, kScreen_Height-64-46) style:UITableViewStylePlain];
    [_myTableView setDataSource:self];
    [_myTableView setDelegate:self];
    [_myTableView setBackgroundColor:kAppMainBackgroundColor];
    [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_myTableView registerClass:[TimelineCell class] forCellReuseIdentifier:kCellIdentifier_TimelineCell];
    [self.view addSubview:_myTableView];
    
    _myTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestFriendTimelineData];
    }];
    
    [_myTableView.header beginRefreshing];
}

#pragma mark - Network Request
- (void)requestFriendTimelineData{
    WeakSelfType blockSelf = self;
//    [[FC_NetAPIManager sharedManager] request_TimelineDataWithParams:@{@"username":@"18583750607",
//                                                                       @"password":@"123123",
//                                                                       @"nickName":@"Braspring"
//                                                                       }
//                                                            andBlock:^(id data, NSError *error) {
//        [blockSelf.timelineArray addObjectsFromArray:data];
//        [blockSelf.myTableView reloadData];
//    }];
    self.timelineArray = [[LocalJsonManager sharedManager] loadLocalJsonDataWithFileName:@"friend" Type:@"json"];
    [_myTableView.header endRefreshing];
    [self.myTableView reloadData];
}

#pragma mark - Method
- (void)publicTimelineAction:(UIButton *)btn{
    TimelineSendViewController *sendVc = [[TimelineSendViewController alloc] init];
    sendVc.sendNextTimeline = ^(Timeline *timeline){
        
    };
    [self presentViewController:sendVc animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.timelineArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Timeline *timeline = [Timeline objectOfClass:NSStringFromClass([Timeline class]) fromJSON:[self.timelineArray objectAtIndex:indexPath.row]];
    return [TimelineCell cellHeightWithObj:timeline];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TimelineCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TimelineCell];
    Timeline *model = [Timeline objectOfClass:NSStringFromClass([Timeline class]) fromJSON:[self.timelineArray objectAtIndex:indexPath.row]];
    [cell setTimeline:model];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

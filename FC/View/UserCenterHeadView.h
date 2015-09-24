//
//  UserCenterHeadView.h
//  FC
//
//  Created by ZhangPeng on 15/9/24.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustoLabelView.h"

@interface UserCenterHeadView : UIView

@property (strong, nonatomic) UIImageView *bgImageView, *headImgView;
@property (strong, nonatomic) UILabel *nameLabel, *followCountLabel, *fansCountLabel;
@property (strong, nonatomic) CustoLabelView *addressView;

@end

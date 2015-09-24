//
//  CustoLabelView.h
//  FC
//
//  Created by ZhangPeng on 15/9/24.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustoLabelView : UIView

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic, readonly) UILabel *textLabel;

- (void)setTitleString:(NSString *)str;

@end

//
//  UITapImageView.h
//  FC
//
//  Created by ZhangPeng on 15/9/17.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapImageView : UIImageView

- (void)addTapBlock:(void (^)(id obj))tapAction;

- (void)setImageWithUrl:(NSString *)imgUrl placeholderImage:(UIImage *)placeholderImage tapBlock:(void (^)(id obj))tapAction;

@end

//
//  CustomCollectionView.m
//  FC
//
//  Created by ZhangPeng on 15/9/22.
//  Copyright © 2015年 Lishan. All rights reserved.
//

#import "CustomCollectionView.h"

@implementation CustomCollectionView


//当事件是传递给此view的内部view时，让子view自动捕获事件，如果是传递给此view自己时，放弃事件捕获
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *__tempView = [super hitTest:point withEvent:event];
    if (__tempView == self) {
        return nil;
    }
    return __tempView;
}

@end

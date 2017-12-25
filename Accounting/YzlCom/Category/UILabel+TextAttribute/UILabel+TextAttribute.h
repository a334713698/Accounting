//
//  UILabel+TextAttribute.h
//  mall
//
//  Created by YZL on 16/3/22.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TextAttribute)
/* 设置label带有删除线 **/
- (void)setLabelWithDelLine;
/* 设置label带有下划线 **/
- (void)setLabelWithUnderLine;
/* 删除label带有下划线 **/
- (void)setLabelWithNoUnderLine;
/* 设置label文字的指定位置的文字颜色 **/
- (void)setLabelText:(NSString *)str Color:(UIColor *)color Range:(NSRange)range;
/* 设置label指定位置的文字颜色(可设置多个位置) **/
- (void)setLabelText:(NSString *)str ColorArr:(NSArray <UIColor *>*)colorArr RangeArr:(NSArray <NSArray *>*)rangeArr;
@end

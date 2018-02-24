//
//  UILabel+Rect.h
//  hwgmall
//
//  Created by Morgan on 15/9/22.
//  Copyright (c) 2015年 hwgmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Rect)


/**
 根据内容计算label尺寸

 @param text 内容
 @param fontSize 字体尺寸
 @param maxSize 设定尺寸
 @return 尺寸
 */
+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;

- (CGSize)labelAutoCalculateRect;

@end

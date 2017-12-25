//
//  UILabel+Rect.m
//  hwgmall
//
//  Created by Morgan on 15/9/22.
//  Copyright (c) 2015年 hwgmall. All rights reserved.
//

#import "UILabel+Rect.h"

@implementation UILabel (Rect)

+ (CGSize)labelAutoCalculateRectWith:(NSString*)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize

{
    NSMutableParagraphStyle* paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode=NSLineBreakByWordWrapping;
    
    NSDictionary* attributes =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    
    
    labelSize.height = ceil(labelSize.height);
    
    labelSize.width = ceil(labelSize.width);
    
    return labelSize;
}

@end

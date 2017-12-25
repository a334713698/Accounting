//
//  UIImage+DeepCopy.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/21.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "UIImage+DeepCopy.h"

@implementation UIImage (DeepCopy)

- (UIImage*)deepCopy{
    NSData* imgData = UIImagePNGRepresentation(self);
    return [UIImage imageWithData:imgData];
}

@end

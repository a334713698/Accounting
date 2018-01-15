//
//  UIImage+Radius.m
//  Accounting
//
//  Created by 洪冬介 on 2018/1/15.
//  Copyright © 2018年 hongdongjie. All rights reserved.
//

#import "UIImage+Radius.h"

@implementation UIImage (Radius)

-(UIImage *)getImageRadius:(CGFloat)radius andImage:(UIImage *)image{
    
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(c, path.CGPath);
    CGContextClip(c);
    [image drawInRect:rect];
    CGContextDrawPath(c, kCGPathFillStroke);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end

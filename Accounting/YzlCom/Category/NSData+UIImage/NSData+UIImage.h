//
//  NSData+UIImage.h
//  Indiana
//
//  Created by irene on 16/4/18.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (UIImage)

- (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize;

@end

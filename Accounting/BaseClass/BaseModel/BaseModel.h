//
//  BaseModel.h
//  mall
//
//  Created by irene on 16/3/9.
//  Copyright © 2016年 HZYuanzhoulvNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

/**
 *  自定义一个初始化方法
 *
 *  @param dic 字典类型数据
 *
 *  @return model数据
 */
- (id)initWithContentsOfDic:(NSDictionary *)dic;

@end

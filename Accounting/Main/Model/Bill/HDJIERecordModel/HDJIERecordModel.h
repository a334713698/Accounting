//
//  HDJIERecordModel.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/18.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseModel.h"

@interface HDJIERecordModel : BaseModel

@property (nonatomic, assign) NSInteger record_id;
@property (nonatomic, assign) HDJProjectType type_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) long long create_time;

@end

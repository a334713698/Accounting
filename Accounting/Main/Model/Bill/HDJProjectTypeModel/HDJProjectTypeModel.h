//
//  HDJProjectTypeModel.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/18.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseModel.h"

@interface HDJProjectTypeModel : BaseModel

@property (nonatomic, assign) HDJProjectType type_id;
@property (nonatomic, copy) NSString *name;

@end

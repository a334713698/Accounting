//
//  HDJIncomeExpensesModel.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/18.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseModel.h"

@interface HDJIncomeExpensesModel : BaseModel

@property (nonatomic, assign) NSInteger cate_id;
@property (nonatomic, assign) HDJProjectType type_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

@end

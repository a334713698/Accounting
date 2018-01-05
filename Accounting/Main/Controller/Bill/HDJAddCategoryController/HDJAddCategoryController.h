//
//  HDJAddCategoryController.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/22.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseViewController.h"
#import "HDJIncomeExpensesModel.h"

@interface HDJAddCategoryController : BaseViewController

@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, assign) HDJProjectType type;

@property (nonatomic, strong) HDJIncomeExpensesModel* editModel;

@end

//
//  HDJRecordView.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/19.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "BaseView.h"
#import "HDJRecordTopView.h"
#import "HDJIncomeExpensesModel.h"

@class HDJRecordView;

@protocol HDJRecordViewDelegate <NSObject>

- (void)recordView:(HDJRecordView*)recordView withChooseItem:(HDJIncomeExpensesModel*)model;
- (void)editWithRecordView:(HDJRecordView*)recordView;

@end

@interface HDJRecordView : BaseView

@property (nonatomic, strong) HDJIncomeExpensesModel *selectedModel;

@property (nonatomic, strong) HDJRecordTopView *recordTopView;
@property (nonatomic, assign) HDJProjectType type;
@property (nonatomic, weak) id<HDJRecordViewDelegate> delegate;

- (instancetype)initWithType:(HDJProjectType)type;
@property (nonatomic, strong) DJDatabaseManager* dbMgr;

- (void)selectItemWithIndex:(NSInteger)index;
- (void)updateData;
@end

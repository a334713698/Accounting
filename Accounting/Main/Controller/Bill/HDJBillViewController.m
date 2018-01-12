//
//  HDJBillViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/12.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJBillViewController.h"
#import "HDJIERecordModel.h"

@interface HDJBillViewController ()

@property (nonatomic, strong) NSMutableArray<HDJIERecordModel*> *dataArr;


@end

@implementation HDJBillViewController

#pragma mark - lazy load
-(NSMutableArray<HDJIERecordModel*> *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        [self.dbMgr.database open];
        
        [_dataArr addObjectsFromArray:[HDJIERecordModel mj_objectArrayWithKeyValuesArray:[self.dbMgr getAllTuplesFromTabel:record_income_expenses_table]]];
        
        [self.dbMgr.database close];

    }
    return _dataArr;
}


#pragma mark - view func
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"账单";
    self.view.backgroundColor = WHITE_COLOR;

    DLog(@"%ld",self.dataArr.count);

}


#pragma mark - SEL


#pragma mark - Method



#pragma mark - NetRequest





@end

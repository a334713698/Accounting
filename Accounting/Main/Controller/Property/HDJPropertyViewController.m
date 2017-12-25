//
//  HDJPropertyViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/12.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJPropertyViewController.h"

@interface HDJPropertyViewController ()


@end

@implementation HDJPropertyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"资产";
    self.view.backgroundColor = WHITE_COLOR;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //打开数据库对象
    BOOL isOpen = [self.dbMgr.database open];
    
    
    if (isOpen) {
        
        /**
         
            //4.查询操作
            FMResultSet *result = [self.dbMgr.database executeQuery:@"select * from Stu"];
            while([result next]) {
                //根据给定字段取值
                int ID = [result intForColumn:@"id"];
                NSString* name = [result stringForColumn:@"name"];
                int age = [result intForColumn:@"age"];
                NSLog(@"%d,%@,%d",ID,name,age);
        */
        
        [self init_all_income_expenses_table];
        [self init_inuse_income_expenses_table];
        [self init_record_income_expenses_table];
        [self init_project_type_table];
        
        [self.dbMgr getAllTuplesFromTabel:all_income_expenses_table];
    }else{
        NSLog(@"数据库打开失败");
    }
    
    //5.关闭数据库
    [self.dbMgr.database close];
}

//创建all_income_expenses_table，并插入数据
- (void)init_all_income_expenses_table{
    
    BOOL isCreated = [self.dbMgr createTableWithName:all_income_expenses_table andKeyValues:@{@"cate_id":@"integer primary key",@"name":@"text",@"type_id":@"integer",@"icon":@"text"}];

    if (isCreated) {
        [self.dbMgr insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_star\'"}];
        [self.dbMgr insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_star\'"}];
    }
}

//创建inuse_income_expenses_table，并插入数据
- (void)init_inuse_income_expenses_table{

    BOOL isCreated = [self.dbMgr createTableWithName:inuse_income_expenses_table andKeyValues:@{@"cate_id":@"integer primary key",@"name":@"text",@"type_id":@"integer",@"icon":@"text"}];
    
    if (isCreated) {
        
    }
}

//创建record_income_expenses_table，并插入数据
- (void)init_record_income_expenses_table{

    BOOL isCreated = [self.dbMgr createTableWithName:record_income_expenses_table andKeyValues:@{@"record_id":@"integer primary key",@"name":@"text",@"type_id":@"integer",@"amount":@"double",@"create_time":@"integer",@"icon":@"text"}];

    if (isCreated) {
        
    }

}

//创建project_type_table，并插入数据
- (void)init_project_type_table{
    
    BOOL isCreated = [self.dbMgr createTableWithName:project_type_table andKeyValues:@{@"type_id":@"integer primary key",@"name":@"text"}];
    
    if (isCreated) {
        [self.dbMgr insertDataIntoTableWithName:project_type_table andKeyValues:@{@"name":@"\'收入\'"}];
        [self.dbMgr insertDataIntoTableWithName:project_type_table andKeyValues:@{@"name":@"\'支出\'"}];
    }

}

@end

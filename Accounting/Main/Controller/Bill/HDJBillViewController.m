//
//  HDJBillViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/12.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJBillViewController.h"

@interface HDJBillViewController ()

@end

@implementation HDJBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"账单";
    self.view.backgroundColor = WHITE_COLOR;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //0.数据库文件路径
    NSString* dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:DATABASE_NAME];
    
    //1.创建一个数据库文件
    FMDatabase* database = [FMDatabase databaseWithPath:dbPath];
    //打开数据库对象
    BOOL isOpen = [database open];
    
    if (isOpen) {
        //2.创建表（有主键）
        //BOOL isCreated = [database executeUpdate:@"create table if not exists Stu (id integer primary key,name text,age integer)"];
        
        BOOL isCreated = YES;
        if (isCreated) {
            //3.插入操作
            //[database executeUpdate:@"insert into Stu (name,age) values ('Nancy',18)"];
            
            NSString* sqlStr = [NSString stringWithFormat:@"select * from %@",all_income_expenses_table];
            //4.查询操作
            FMResultSet *result = [database executeQuery:sqlStr];
            while([result next]) {
                //根据给定字段取值
                NSInteger cate_id = [result intForColumn:@"cate_id"];
                NSString* name = [result stringForColumn:@"name"];
                int type = [result intForColumn:@"type"];
                NSLog(@"%ld,%@,%d",cate_id,name,type);
            }
            
            
        }else{
            NSLog(@"表创建失败");
        }
        
    }else{
        NSLog(@"数据库打开失败");
    }
    
    //5.关闭数据库
    [database close];
}


@end

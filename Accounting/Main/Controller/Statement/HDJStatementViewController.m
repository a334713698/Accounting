//
//  HDJStatementViewController.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/12.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "HDJStatementViewController.h"

@interface HDJStatementViewController ()

@end

@implementation HDJStatementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navTitle = @"报表";
    self.view.backgroundColor = WHITE_COLOR;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //0.数据库文件路径
    NSString* dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"db_test.sqlite"];
    DLog(@"%@",dbPath);
    
    //1.创建一个数据库文件
    FMDatabase* database = [FMDatabase databaseWithPath:dbPath];
    //打开数据库对象
    BOOL isOpen = [database open];
    
    if (isOpen) {
        //2.创建表（有主键）
        BOOL isCreated = [database executeUpdate:@"create table if not exists Stu (id integer primary key,name text,age integer)"];
        
        if (isCreated) {
            //3.插入操作
            [database executeUpdate:@"insert into Stu (name,age) values ('Nancy',18)"];
            
            //4.查询操作
            FMResultSet *result = [database executeQuery:@"select * from Stu"];
            while([result next]) {
                //根据给定字段取值
                int ID = [result intForColumn:@"id"];
                NSString* name = [result stringForColumn:@"name"];
                int age = [result intForColumn:@"age"];
                NSLog(@"%d,%@,%d",ID,name,age);
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

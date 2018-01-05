//
//  DJDatabaseManager.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/16.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import <fmdb/FMDB.h>
#import "HDJDSQLSearchModel.h"

@interface DJDatabaseManager : FMDatabase

@property (nonatomic, strong) FMDatabase* database;
@property (nonatomic, copy) NSString *database_name;

+ (instancetype)sharedDJDatabaseManager;
- (void)initializeDB;

///创建表格
- (BOOL)createTableWithName:(NSString*)name andKeyValues:(NSDictionary*)key_values;

///插入元素
- (BOOL)insertDataIntoTableWithName:(NSString*)name andKeyValues:(NSDictionary*)key_values;

///获取某张表的所有属性（即表的首列元素）
- (NSArray*)getAllColumnNameFromTabel:(NSString*)name;

///获取某张表所有的元组（即所有属性的值）
- (NSArray<NSDictionary*>*)getAllTuplesFromTabel:(NSString *)name;

///通过单个搜索条件，获取某张表所有的元组
- (NSArray<NSDictionary*>*)getAllTuplesFromTabel:(NSString *)name andSearchModel:(HDJDSQLSearchModel*)searchModel;

@end

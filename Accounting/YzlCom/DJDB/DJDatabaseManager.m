//
//  DJDatabaseManager.m
//  Accounting
//
//  Created by 洪冬介 on 2017/7/16.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import "DJDatabaseManager.h"

@implementation DJDatabaseManager

SYNTHESIZE_SINGLETON_FOR_CLASS(DJDatabaseManager)


- (FMDatabase *)database{
    if (!_database) {
        NSString* dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:DATABASE_NAME];
        _database = [FMDatabase databaseWithPath:dbPath];
        DLog(@"%@",dbPath);
    }
    return _database;
}

//初始化app数据库数据
- (void)initializeDB{
    //打开数据库对象
    BOOL isOpen = [self.database open];
    
    if (isOpen) {
        [self init_all_income_expenses_table];
        [self init_inuse_income_expenses_table];
        [self init_record_income_expenses_table];
        [self init_project_type_table];
    }else{
        NSLog(@"数据库打开失败");
    }
    
    [self.database close];
}

//创建all_income_expenses_table，并插入数据
- (void)init_all_income_expenses_table{
    
    BOOL isCreated = [self createTableWithName:all_income_expenses_table andKeyValues:@{@"cate_id":@"integer primary key",@"name":@"text",@"type_id":@"integer",@"icon":@"text"}];
    
    if (isCreated) {
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_income_gongzishouru\'"}];
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_income_qitashouru\'"}];
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_income_touzishouru\'"}];
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_canyin\'"}];
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_jiaotong\'"}];
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_jujia\'"}];
        [self insertDataIntoTableWithName:all_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_yifu\'"}];
    }
}

//创建inuse_income_expenses_table，并插入数据
- (void)init_inuse_income_expenses_table{
    
    BOOL isCreated = [self createTableWithName:inuse_income_expenses_table andKeyValues:@{@"cate_id":@"integer primary key",@"name":@"text",@"type_id":@"integer",@"icon":@"text"}];
    
    if (isCreated) {
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_income_gongzishouru\'",@"name":@"\'工资\'"}];
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_income_qitashouru\'",@"name":@"\'其他\'"}];
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"1",@"icon":@"\'icon_income_touzishouru\'",@"name":@"\'投资\'"}];
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_canyin\'",@"name":@"\'餐饮\'"}];
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_jiaotong\'",@"name":@"\'交通\'"}];
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_jujia\'",@"name":@"\'居家\'"}];
        [self insertDataIntoTableWithName:inuse_income_expenses_table andKeyValues:@{@"type_id":@"2",@"icon":@"\'icon_expenses_yifu\'",@"name":@"\'衣服\'"}];
    }
}

//创建record_income_expenses_table，并插入数据
- (void)init_record_income_expenses_table{
    
    BOOL isCreated = [self createTableWithName:record_income_expenses_table andKeyValues:@{@"record_id":@"integer primary key",@"name":@"text",@"type_id":@"integer",@"amount":@"double",@"create_time":@"integer",@"icon":@"text"}];
    
    if (isCreated) {
        
    }
    
}

//创建project_type_table，并插入数据
- (void)init_project_type_table{
    
    BOOL isCreated = [self createTableWithName:project_type_table andKeyValues:@{@"type_id":@"integer primary key",@"name":@"text"}];
    
    if (isCreated) {
        [self insertDataIntoTableWithName:project_type_table andKeyValues:@{@"name":@"\'收入\'"}];
        [self insertDataIntoTableWithName:project_type_table andKeyValues:@{@"name":@"\'支出\'"}];
    }
    
}


//创建表
- (BOOL)createTableWithName:(NSString*)name andKeyValues:(NSDictionary*)key_values{
    NSArray* keysArr = [key_values allKeys];
    NSMutableArray* tupleArr = [NSMutableArray array];
    for (NSString* key in keysArr) {
        NSString* value = key_values[key];
        NSString* key_value = [NSString stringWithFormat:@"%@ %@",key,value];
        [tupleArr addObject:key_value];
    }
    NSString* tupleStr = [tupleArr componentsJoinedByString:@","];
    NSString* sqlStr = [NSString stringWithFormat:@"create table if not exists %@ (%@)",name,tupleStr];
    
    BOOL isSuccess = [self.database executeUpdate:sqlStr];
    
    if (isSuccess) {
        DLog(@"%@ 表创建成功",name);
    }else{
        DLog(@"%@ 表创建失败",name);
    }
    return isSuccess;
}

//插入数据
- (BOOL)insertDataIntoTableWithName:(NSString*)name andKeyValues:(NSDictionary*)key_values{
    
    NSArray* keysArr = [key_values allKeys];
    NSMutableArray* valuesArr = [NSMutableArray array];
    for (NSString* key in keysArr) {
        NSString* value = key_values[key];
        [valuesArr addObject:value];
    }
    
    NSString* keysStr = [keysArr componentsJoinedByString:@","];
    NSString* valuesStr = [valuesArr componentsJoinedByString:@","];

    NSString* sqlStr = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",name,keysStr,valuesStr];

    BOOL isSuccess = [self.database executeUpdate:sqlStr];
    if (isSuccess) {
        DLog(@"%@ 数据插入成功",name);
    }else{
        DLog(@"%@ 数据插入失败",name);
    }
    return isSuccess;
}

//更新数据
- (BOOL)updateDataIntoTableWithName:(NSString*)name andSearchModel:(HDJDSQLSearchModel*)searchModel andNewModel:(HDJDSQLSearchModel*)newModel{
    
    NSString* sqlStr = [NSString stringWithFormat:@"update %@ set %@%@%@ where %@%@%@",name,newModel.attriName,newModel.symbol,newModel.specificValue,searchModel.attriName,searchModel.symbol,searchModel.specificValue];

    BOOL isSuccess = [self.database executeUpdate:sqlStr];
    
    if (isSuccess) {
        DLog(@"%@ 数据更新成功",name);
    }else{
        DLog(@"%@ 数据更新失败",name);
    }

    return isSuccess;
}

///更新某一行中的若干列
- (BOOL)updateDataIntoTableWithName:(NSString*)name andSearchModel:(HDJDSQLSearchModel*)searchModel andNewModelArr:(NSArray<HDJDSQLSearchModel*>*)newModelArr{
    NSMutableArray* newSqlArr = [NSMutableArray new];
    
    for (HDJDSQLSearchModel* newModel in newModelArr) {
        [newSqlArr addObject:[NSString stringWithFormat:@"%@%@%@",newModel.attriName,newModel.symbol,newModel.specificValue]];
    }
    
    NSString* updateStr = [newSqlArr componentsJoinedByString:@","];
    
    NSString* sqlStr = [NSString stringWithFormat:@"update %@ set %@ where %@%@%@",name,updateStr,searchModel.attriName,searchModel.symbol,searchModel.specificValue];
    
    BOOL isSuccess = [self.database executeUpdate:sqlStr];
    
    if (isSuccess) {
        DLog(@"%@ 数据更新成功",name);
    }else{
        DLog(@"%@ 数据更新失败",name);
    }
    
    return isSuccess;
}

///删除某个元素
- (BOOL)deleteDataFromTabel:(NSString *)name andSearchModel:(HDJDSQLSearchModel*)searchModel{
    
    NSString* sqlStr = [NSString stringWithFormat:@"delete from %@ where %@%@%@",name,searchModel.attriName,searchModel.symbol,searchModel.specificValue];

    BOOL isSuccess = [self.database executeUpdate:sqlStr];
    
    if (isSuccess) {
        DLog(@"%@ 数据删除成功",name);
    }else{
        DLog(@"%@ 数据删除失败",name);
    }
    
    return isSuccess;
}

//获取某张表所有的首列元素
- (NSArray*)getAllColumnNameFromTabel:(NSString*)name{
    NSString* sql = [NSString stringWithFormat:@"select * from %@",name];
    FMResultSet *result = [self.database executeQuery:sql];
    return result.columnNameToIndexMap.allKeys;
}

//获取某张表所有的元组
- (NSArray<NSDictionary*>*)getAllTuplesFromTabel:(NSString *)name{
    NSMutableArray<NSDictionary*>* result_arr = [NSMutableArray array];
    
    NSString* sql = [NSString stringWithFormat:@"select * from %@",name];
    FMResultSet *result = [self.database executeQuery:sql];
    while([result next]) {
        [result_arr addObject:result.resultDictionary];
    }
    
    return [result_arr copy];
}

//通过单个搜索条件，获取某张表所有的元组
- (NSArray<NSDictionary*>*)getAllTuplesFromTabel:(NSString *)name andSearchModel:(HDJDSQLSearchModel*)searchModel{
    NSMutableArray<NSDictionary*>* result_arr = [NSMutableArray array];
    
    NSString* sql = [NSString stringWithFormat:@"select * from %@ where %@%@%@",name,searchModel.attriName,searchModel.symbol,searchModel.specificValue];
    FMResultSet *result = [self.database executeQuery:sql];
    while([result next]) {
        [result_arr addObject:result.resultDictionary];
    }
    
    return [result_arr copy];

}


@end

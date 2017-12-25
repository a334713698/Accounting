//
//  DJDatabaseManager.h
//  Accounting
//
//  Created by 洪冬介 on 2017/7/16.
//  Copyright © 2017年 hongdongjie. All rights reserved.
//

#import <fmdb/FMDB.h>

@interface DJDatabaseManager : FMDatabase

@property (nonatomic, strong) FMDatabase* database;
@property (nonatomic, copy) NSString *database_name;

+ (instancetype)sharedDJDatabaseManager;
- (void)initializeDB;

- (BOOL)createTableWithName:(NSString*)name andKeyValues:(NSDictionary*)key_values;
- (BOOL)insertDataIntoTableWithName:(NSString*)name andKeyValues:(NSDictionary*)key_values;
- (NSArray*)getAllColumnNameFromTabel:(NSString*)name;
- (NSArray<NSDictionary*>*)getAllTuplesFromTabel:(NSString *)name;
    
@end

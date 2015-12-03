//
//  DBManager.m
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "DBManager.h"

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

+(DBManager*)getSharedInstance{
        if (!sharedInstance) {
                sharedInstance = [[super allocWithZone:NULL]init];
                [sharedInstance createDB];
        }
        return sharedInstance;
}

-(NSMutableDictionary*) queryDB: (NSString*) query{
        sqlite3_reset(statement);
        NSMutableArray *keyArray = [[NSMutableArray alloc] init];
        NSMutableDictionary *resultSet = [[NSMutableDictionary alloc] init];
        NSInteger columnCount = 0;
        NSInteger dataCount = 0;
        const char *thePath = [dbPath UTF8String];
        
        if (sqlite3_open(thePath, &database) == SQLITE_OK)
        {
                NSString *querySQL = query;
                const char *query_stmt = [querySQL UTF8String];
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                        columnCount = sqlite3_column_count(statement);
                        dataCount = sqlite3_data_count(statement);
                        for (int i = 0; i < columnCount; i++) {
                                NSString *key = [NSString stringWithUTF8String:(char *) sqlite3_column_name(statement, i)];
                                [keyArray addObject: key];
                        }
                        for (id element in keyArray) {
                                [resultSet setObject:[[NSMutableArray alloc]init] forKey:element];
                        }
                        while (sqlite3_step(statement) == SQLITE_ROW)
                        {
                                for (int i = 0; i < columnCount; i++) {
                                        NSString *value = [[NSString alloc] init];
                                        if (sqlite3_column_type(statement, i) != SQLITE_NULL) {
                                                value = [NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, i)];
                                        }
                                        if (sqlite3_column_type(statement, i) == SQLITE_NULL || value == NULL || [value isEqualToString:@";"]) {
                                                value = @";";
                                        }
                                        NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
                                        tmpArray = [resultSet valueForKey:[keyArray objectAtIndex:i]];
                                        [tmpArray addObject:value];
                                        [resultSet setObject:tmpArray forKey:[keyArray objectAtIndex:i]];
                                }
                        }
                }
        }
        return resultSet;
}

-(BOOL)createDB {
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSString *targetPath = [libraryPath stringByAppendingPathComponent:@"MAMICare.sqlite3"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:targetPath]) {
        // database doesn't exist in your library path... copy it from the bundle
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"MAMICare" ofType:@"sqlite3"];
        NSError *error = nil;
        
        if (![[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:targetPath error:&error]) {
            NSLog(@"Error: %@", error);
        }
    }
    dbPath = targetPath;
        BOOL isSuccess = YES;
        NSFileManager *filemgr = [NSFileManager defaultManager];
        NSLog(dbPath);
        if ([filemgr fileExistsAtPath: dbPath] == NO) {
                const char *dbpath = [dbPath UTF8String];
                if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
                        char *errMsg;
                        const char *sql_stmt = "create table if not exists Patient (id integer PRIMARY KEY AUTOINCREMENT, addressId integer, firstName varchar, lastName1 varchar, lastName2 varchar, birthDate varchar, email varchar, curp varchar, comments varchar, isActive integer, createdAt timestamp NOT NULL DEFAULT(CURRENT_TIMESTAMP));";
                        if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
                                isSuccess = NO;
                        }
                        sqlite3_close(database);
                        return  isSuccess;
                }
                else {
                        isSuccess = NO;
                }
        }
        return isSuccess;
}

-(NSInteger) getLastId {
        return sqlite3_last_insert_rowid(database);
}

-(NSInteger) updateDB: (NSString*) query {
        sqlite3_reset(statement);
        const char *thePath = [dbPath UTF8String];
        if (sqlite3_open(thePath, &database) == SQLITE_OK) {
                const char *query_stmt = [query UTF8String];
                NSLog(@"%s", query_stmt);
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                        if (sqlite3_step(statement) == SQLITE_DONE) {
//                            sqlite3_finalize(statement);
                                return sqlite3_changes(database);
                        }
                }
        }
        return 0;
}

@end

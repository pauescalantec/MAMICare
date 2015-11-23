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

-(BOOL)createDB{
        dbPath = [[NSBundle mainBundle] pathForResource:@"MAMICare" ofType:@"sqlite3"];
        BOOL isSuccess = YES;
        NSFileManager *filemgr = [NSFileManager defaultManager];
        NSLog(dbPath);
        if ([filemgr fileExistsAtPath: dbPath] == NO)
        {
                const char *dbpath = [dbPath UTF8String];
                if (sqlite3_open(dbpath, &database) == SQLITE_OK)
                {
                        char *errMsg;
                        const char *sql_stmt = "create table if not exists Patient (id integer PRIMARY KEY AUTOINCREMENT, addressId integer, firstName varchar, lastName1 varchar, lastName2 varchar, birthDate varchar, email varchar, curp varchar, comments varchar, isActive integer, createdAt timestamp NOT NULL DEFAULT(CURRENT_TIMESTAMP));";
                        if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg)
                            != SQLITE_OK)
                        {
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

-(NSInteger) createNewAddress: (Address*) newAddress {
        sqlite3_reset(statement);
        const char *thePath = [dbPath UTF8String];
        if (sqlite3_open(thePath, &database) == SQLITE_OK)
        {
                NSString *querySQL = [NSString stringWithFormat:
                                      @"INSERT INTO Address (addressLine1, addressLine2, city, state, country, zipCode) VALUES ('%@', '%@', '%@', '%@', '%@', '%d')", newAddress.addressLine1, newAddress.addressLine2, newAddress.city, newAddress.state, newAddress.country, newAddress.zipCode];
                const char *query_stmt = [querySQL UTF8String];
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                        if (sqlite3_step(statement) == SQLITE_DONE) {
                                return sqlite3_last_insert_rowid(database);
                        }
                }
        }
        return 0;
}

-(BOOL) createNewConsultation: (Consultation*) newConsultation {
        return YES;
}

-(BOOL) createNewPatient: (Patient*) newPatient withAddress: (Address*) newAddress {
        newPatient.pAddress = [[Address alloc] init];
        newAddress.pID = [self createNewAddress:newAddress];
        if (newAddress.pID != 0) {
                newPatient.pAddress = newAddress;
                sqlite3_reset(statement);
                const char *thePath = [dbPath UTF8String];
                if (sqlite3_open(thePath, &database) == SQLITE_OK)
                {
                        NSString *querySQL = [NSString stringWithFormat:
                                              @"INSERT INTO Patient (addressId, firstName, lastName1, lastName2,birthDate, email, curp, comments, isActive) VALUES ('%d','%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", newPatient.pAddress.pID, newPatient.name, newPatient.lastname1, newPatient.lastname2, newPatient.birthDate, newPatient.email, newPatient.curp, newPatient.comments, [NSString stringWithFormat:@"%d", newPatient.isActive]];
                        const char *query_stmt = [querySQL UTF8String];
                        if (sqlite3_prepare_v2(database,
                                               query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                                if (sqlite3_step(statement) == SQLITE_DONE) {
                                        [patientArray addObject:newPatient];
                                        return YES;
                                }
                        }
                }
        }
        return NO;
}



-(Address*) readAddress: (int) addressID {
        Address *resultAddress = [[Address alloc] init];
        const char *thePath = [dbPath UTF8String];
        
        if (sqlite3_open(thePath, &database) == SQLITE_OK) {
                NSString *querySQL = [NSString stringWithFormat:
                                      @"SELECT * FROM Address WHERE id=%d", addressID];
                
                const char *query_stmt = [querySQL UTF8String];
                
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                        if (sqlite3_step(statement) == SQLITE_ROW) {
                                if (sqlite3_column_type(statement, 0) != SQLITE_NULL) {
                                        NSInteger pID = sqlite3_column_int(statement, 0);
                                        resultAddress.pID = pID;
                                        NSLog(@"Address id");
                                }
                                if (sqlite3_column_type(statement, 1) != SQLITE_NULL) {
                                        NSString *addressLine1 =  [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 1)];
                                        resultAddress.addressLine1 = addressLine1;
                                        NSLog(@"Address line 1");
                                }
                                if (sqlite3_column_type(statement, 2) != SQLITE_NULL) {
                                        NSString *addressLine2 =  [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 2)];
                                        resultAddress.addressLine2 = addressLine2;
                                        NSLog(@"Address line 2");
                                }
                                if (sqlite3_column_type(statement, 3) != SQLITE_NULL) {
                                        NSString *city = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 3)];
                                        resultAddress.city = city;
                                        NSLog(@"City");
                                }
                                if (sqlite3_column_type(statement, 4) != SQLITE_NULL) {
                                        NSString *state = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                        resultAddress.state = state;
                                        NSLog(@"State");
                                }
                                if (sqlite3_column_type(statement, 5) != SQLITE_NULL) {
                                        NSString *country = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 5)];
                                        resultAddress.country = country;
                                        NSLog(@"Country");
                                }
                                if (sqlite3_column_type(statement, 6) != SQLITE_NULL) {
                                        NSInteger zipcode = sqlite3_column_int(statement, 6);
                                        resultAddress.zipCode = zipcode;
                                        NSLog(@"Zip code");
                                }
                                if (sqlite3_column_type(statement, 7) != SQLITE_NULL) {
                                        char *epochCreatedAt = (char *)sqlite3_column_text(statement, 7);
                                        NSString *epochString  = [NSString stringWithUTF8String:epochCreatedAt];
                                        epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
                                        NSTimeInterval seconds = [epochString doubleValue];
                                        resultAddress.createdAt = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
                                        NSLog(@"Created at");
                                }
                        }
                }
        }
        return resultAddress;
}

-(BOOL) loadAllPatients {
        patientArray = [[NSMutableArray alloc] init];
        Patient *tmpPatient = [[Patient alloc] init];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
        [dateFormat setLocale:[NSLocale currentLocale]];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        [dateFormat setFormatterBehavior:NSDateFormatterBehaviorDefault];
        
        [dateFormat setLocale:[NSLocale localeWithLocaleIdentifier:@"ES"]];
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
        [timeFormat setTimeZone:[NSTimeZone systemTimeZone]];
        [timeFormat setLocale:[NSLocale currentLocale]];
        [timeFormat setDateFormat:@"yyyy/mm/dd HH:mm:ss"];
        [timeFormat setFormatterBehavior:NSDateFormatterBehaviorDefault];
        sqlite3_reset(statement);
        
        const char *thePath = [dbPath UTF8String];
        
        if (sqlite3_open(thePath, &database) == SQLITE_OK)
        {
                NSLog(@"Opened database");
                NSString *querySQL = @"SELECT * FROM Patient";
                const char *query_stmt = [querySQL UTF8String];
                if (sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                        NSLog(@"Prepared query");
                        while (sqlite3_step(statement) == SQLITE_ROW)
                        {
                                NSLog(@"Reading row");
                                NSInteger pID = sqlite3_column_int(statement, 0);
                                tmpPatient.pID = pID;
                                if (sqlite3_column_type(statement, 1) != SQLITE_NULL) {
                                        int addressID = sqlite3_column_int(statement, 1);
                                        Address *tmpAddress = [self readAddress:addressID];
                                        tmpPatient.pAddress = tmpAddress;
                                        NSLog(@"Address ID");
                                }
                                if (sqlite3_column_type(statement, 2) != SQLITE_NULL) {
                                        NSString *name = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 2)];
                                        tmpPatient.name = name;
                                        NSLog(@"Name");
                                }
                                if (sqlite3_column_type(statement, 3) != SQLITE_NULL) {
                                        NSString *lastName1 = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text (statement, 3)];
                                        tmpPatient.lastname1 = lastName1;
                                        NSLog(@"Last name 1");
                                }
                                if (sqlite3_column_type(statement, 4) != SQLITE_NULL) {
                                        NSString *lastName2  = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text (statement, 4)];
                                        tmpPatient.lastname2 = lastName2;
                                        NSLog(@"Last name 2");
                                }
                                if (sqlite3_column_type(statement, 5) != SQLITE_NULL) {
                                        char *birthDateColumn = (char *)sqlite3_column_text(statement, 5);
                                        NSString *birthDateString  = [NSString stringWithUTF8String:birthDateColumn];
                                        birthDateString = [birthDateString stringByReplacingOccurrencesOfString:@" " withString:@""];
                                        tmpPatient.birthDate = [dateFormat dateFromString:birthDateString];
                                        NSLog(@"Birthday");
                                }
                                if (sqlite3_column_type(statement, 6) != SQLITE_NULL) {
                                        NSString *email = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                        tmpPatient.email = email;
                                        NSLog(@"Email");
                                }
                                if (sqlite3_column_type(statement, 7) != SQLITE_NULL) {
                                        NSString *curp = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                        tmpPatient.curp = curp;
                                        NSLog(@"Curp");
                                }
                                if (sqlite3_column_type(statement, 8) != SQLITE_NULL) {
                                        NSString *comments = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                        tmpPatient.comments = comments;
                                        NSLog(@"Comments");
                                }
                                int isActive = sqlite3_column_int(statement, 9);
                                tmpPatient.isActive = (isActive != 0);
                                if (sqlite3_column_type(statement, 10) != SQLITE_NULL) {
                                        char *epochCreatedAt = (char *)sqlite3_column_text(statement, 10);
                                        NSString *epochString  = [NSString stringWithUTF8String:epochCreatedAt];
                                        epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
                                        NSTimeInterval seconds = [epochString doubleValue];
                                        tmpPatient.createdAt = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
                                        NSLog(@"Created at");
                                }
                                [patientArray addObject:tmpPatient];
                                tmpPatient = [[Patient alloc] init];
                        }
                }
                else {
                        return NO;
                }
        }
        else {
                return NO;
        }
        return YES;
}


@end

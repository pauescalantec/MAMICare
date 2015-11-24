//
//  NSObject+DBManager.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject {
        NSString *dbPath;
}

+(DBManager*) getSharedInstance;
-(BOOL) createDB;
-(NSInteger) updateDB: (NSString*) query;
-(NSInteger) getLastId;
-(NSMutableDictionary*) queryDB: (NSString*) query;
@end

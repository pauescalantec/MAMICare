//
//  NSObject+DBManager.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Patient.h"
#import "Address.h"
#import "Consultation.h"
extern NSMutableArray *patientArray;
@interface DBManager : NSObject {
        NSString *dbPath;
}

+(DBManager*) getSharedInstance;
-(BOOL) createDB;
//-(Patient*) readNameAndLastName: (NSString*) idNum;
-(BOOL) loadAllPatients;
-(BOOL) createNewPatient: (Patient*) newPatient withAddress: (Address*) newAddress;
-(BOOL) createNewConsultation: (Consultation*) newConsultation;

@end

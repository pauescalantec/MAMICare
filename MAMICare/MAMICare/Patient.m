//
//  NSObject+City.m
//  SPROC-Test
//
//  Created by Natalia García on 11/13/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Patient.h"
#import "Consultation.h"

@implementation Patient

- (id) initWithID: (NSInteger) pID andName: (NSString *) name andLastName: (NSString *) lastname1 {
        self = [super init];
        if (self) {
                self.pID = pID;
                self.name = name;
                self.lastname1 = lastname1;
        }
        return self;
}

-(NSMutableArray*) loadAllAssessments {
    NSMutableArray *assessmentIDArray = [[NSMutableArray alloc] init];
    NSNumber *assessID;
    
    NSString *querySQL = [NSString stringWithFormat:@"SELECT assessmentID FROM Consultation WHERE patientID=%d", self.pID];
    NSMutableDictionary *resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
    int max = [[resultSet objectForKey:@"assessmentID"] count];
    for(int i = 0; i < max; i++) {
        if (![[[resultSet objectForKey:@"assessmentID"] objectAtIndex:i] isEqualToString: @";"]) {
            NSNumberFormatter *numberFormat = [[NSNumberFormatter alloc] init];
            numberFormat.numberStyle = NSNumberFormatterDecimalStyle;
            assessID = [numberFormat numberFromString:[[resultSet objectForKey:@"assessmentID"] objectAtIndex:i]];
        }
        [assessmentIDArray addObject:assessID];
    }
    
    NSMutableArray *assessmentArray = [[NSMutableArray alloc] init];
    Assessment *tmpAssessment = [[Assessment alloc] init];
    
    NSString *strAssessmentID = [[NSString alloc] init];
    NSString *fmt = @" (";
    NSMutableString *query = [[NSMutableString alloc] init];
    [query appendString:@"SELECT * FROM Assessment WHERE id IN ("];
    for(int i = 0; i < [assessmentIDArray count]; i++) {
        fmt = (i < [assessmentIDArray count]-1) ? @"%d, " : @"%d";
        strAssessmentID = [NSString stringWithFormat:fmt, [[assessmentIDArray objectAtIndex:i] integerValue]];
        [query appendString: strAssessmentID];
    }
    [query appendString:@")"];
    
    querySQL = query;
    resultSet = [[NSMutableDictionary alloc] init];
    resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
    max = [[resultSet objectForKey:@"id"] count];
    for(int i = 0; i < max; i++) {
        tmpAssessment.pID = [[[resultSet objectForKey:@"id"] objectAtIndex:i] integerValue];
        
        if (![[[resultSet objectForKey:@"startTime"]objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"startTime"]objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            tmpAssessment.startTime = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        }
        
        if (![[[resultSet objectForKey:@"endTime"] objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"endTime"]objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            tmpAssessment.endTime = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        }
        
        if (![[[resultSet objectForKey:@"pulse"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.pulse = [[[resultSet objectForKey:@"pulse"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"oxygen"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.oxygen = [[[resultSet objectForKey:@"oxygen"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"systolicHeartRate"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.systolicHeartRate = [[[resultSet objectForKey:@"systolicHeartRate"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"diastolicHeartRate"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.diastolicHeartRate = [[[resultSet objectForKey:@"diastolicHeartRate"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"fetalHeartBeat"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.fetalHeartBeat = [[[resultSet objectForKey:@"fetalHeartBeat"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"fetalRegion"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.fetalRegion = [[[resultSet objectForKey:@"fetalRegion"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"urineTest"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.urineTest = [[[resultSet objectForKey:@"urineTest"] objectAtIndex:i] floatValue];
        }
        
        if (![[[resultSet objectForKey:@"contractionsExist"]objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.contractionsExist = ([[[resultSet objectForKey:@"contractionsExist"]objectAtIndex:i] integerValue] != 0);
        }
        
        if (![[[resultSet objectForKey:@"contractionsTime"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.contractionsTime = [[[resultSet objectForKey:@"contractionsTime"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"weight"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.weight = [[[resultSet objectForKey:@"weight"] objectAtIndex:i] floatValue];
        }
        
        if (![[[resultSet objectForKey:@"fundalHeight"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.fundalHeight = [[[resultSet objectForKey:@"fundalHeight"] objectAtIndex:i] floatValue];
        }
        
        if (![[[resultSet objectForKey:@"basalGlucose"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.basalGlucose = [[[resultSet objectForKey:@"basalGlucose"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"observations"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.observations = [[resultSet objectForKey:@"observations"] objectAtIndex:i];
        }
        
        if (![[[resultSet objectForKey:@"lastModified"]objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"lastModified"]objectAtIndex:i];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setTimeZone:[NSTimeZone systemTimeZone]];
            [df setLocale:[NSLocale currentLocale]];
            [df setDateFormat:@"yyyy-MM-dd"];
            [df setFormatterBehavior:NSDateFormatterBehaviorDefault];
            [df setLocale:[NSLocale localeWithLocaleIdentifier:@"ES"]];
            tmpAssessment.lastModified = [df dateFromString:[epochString substringToIndex:10]];
        }
        [assessmentArray addObject:tmpAssessment];
        tmpAssessment = [[Assessment alloc] init];
    }
    return assessmentArray;
}

+(void) loadAllPatients {
    patientArray = [[NSMutableArray alloc] init];
    Patient *tmpPatient = [[Patient alloc] init];
    
    NSString *querySQL = @"SELECT * FROM Patient";
    NSMutableDictionary *resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
    int max = [[resultSet objectForKey:@"id"] count];
    for(int i = 0; i < max; i++) {
        tmpPatient.pID = [[[resultSet objectForKey:@"id"] objectAtIndex:i] integerValue];
        if (![[[resultSet objectForKey:@"addressId"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.pAddress = [[Address alloc] init];
            tmpPatient.pAddress.pID = [[[resultSet objectForKey:@"addressId"]objectAtIndex:i] integerValue];
            [tmpPatient.pAddress load];
        }
        if (![[[resultSet objectForKey:@"firstName"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.name = [[resultSet objectForKey:@"firstName"]objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"lastName1"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.lastname1 = [[resultSet objectForKey:@"lastName1"]objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"lastName2"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.lastname2 = [[resultSet objectForKey:@"lastName2"]objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"birthDate"] objectAtIndex:i] isEqualToString: @";"]) {
            NSString *bd = [[resultSet objectForKey:@"birthDate"] objectAtIndex:i];
            [tmpPatient setBirthDateFromString: [bd substringToIndex:10]];
        }
        if (![[[resultSet objectForKey:@"email"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.email = [[resultSet objectForKey:@"email"] objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"curp"]objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.curp = [[resultSet objectForKey:@"curp"]objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"comments"]objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.comments = [[resultSet objectForKey:@"comments"]objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"isActive"]objectAtIndex:i] isEqualToString: @";"]) {
            tmpPatient.isActive = ([[[resultSet objectForKey:@"isActive"]objectAtIndex:i] integerValue] != 0);
        }
        if (![[[resultSet objectForKey:@"createdAt"]objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"createdAt"]objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            tmpPatient.createdAt = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        }
        [patientArray addObject:tmpPatient];
        tmpPatient = [[Patient alloc] init];
    }
}

- (BOOL) save {
        if (self.pAddress.save) {
            
                NSString *querySQL = [NSString stringWithFormat:
                                      @"INSERT INTO Patient (addressId, firstName, lastName1, lastName2,birthDate, email, curp, comments, isActive) VALUES (%d,'%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", self.pAddress.pID, self.name, self.lastname1, self.lastname2, self.birthDate, self.email, self.curp, @"comments!", [NSString stringWithFormat:@"%d", self.isActive]];
                
                if([[DBManager getSharedInstance] updateDB:querySQL] > 0) {
                        self.pID = [[DBManager getSharedInstance] getLastId];
                        [patientArray addObject:self];
                    NSLog(@"OMG YES");
                        return YES;
                }
        }
        return NO;
}

- (NSString *)getFullName {
        return [NSString stringWithFormat:@"%@ %@", self.lastname1, self.lastname2];
}


- (NSInteger)getAge {
    NSDate* now = [NSDate date];
    NSDate* birthDate = self.birthDate;
    
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear fromDate:self.birthDate toDate:now options:0];
    return [ageComponents year];
}

- (NSString *)getStringBirthDate {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    return [dateFormat stringFromDate:self.birthDate];
}
- (void)setBirthDateFromString:(NSString *)strDate {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormat setLocale:[NSLocale currentLocale]];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    [dateFormat setFormatterBehavior:NSDateFormatterBehaviorDefault];
    [dateFormat setLocale:[NSLocale localeWithLocaleIdentifier:@"ES"]];
    self.birthDate = [dateFormat dateFromString:strDate];
}

- (NSString *)getPhotoURL {
    return [NSString stringWithFormat:@"patient_%ld.png", (long)self.pID];
}

@end

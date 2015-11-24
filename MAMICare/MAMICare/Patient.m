//
//  NSObject+City.m
//  SPROC-Test
//
//  Created by Natalia García on 11/13/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Patient.h"

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

+(void) loadAllPatients {
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
        
        NSString *querySQL = @"SELECT * FROM Patient";
        NSMutableDictionary *resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
        int max = [[resultSet objectForKey:@"id"] count];
        for(int i = 0; i < max; i++) {
                tmpPatient.pID = [[[resultSet objectForKey:@"id"] objectAtIndex:i] integerValue];
                if (![[[resultSet objectForKey:@"addressId"] objectAtIndex:i] isEqualToString: @";"]) {
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
                        tmpPatient.birthDate = [dateFormat dateFromString:[[resultSet objectForKey:@"birthDate"]objectAtIndex:i]];
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
                if (![[[resultSet objectForKey:@"addressId"]objectAtIndex:i] isEqualToString: @";"]) {
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
                                      @"INSERT INTO Patient (addressId, firstName, lastName1, lastName2,birthDate, email, curp, comments, isActive) VALUES (%d,'%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", self.pAddress.pID, self.name, self.lastname1, self.lastname2, self.birthDate, self.email, self.curp, self.comments, [NSString stringWithFormat:@"%d", self.isActive]];
                
                if([[DBManager getSharedInstance] updateDB:querySQL] > 0) {
                        self.pID = [[DBManager getSharedInstance] getLastId];
                        [patientArray addObject:self];
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
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:self.birthDate
                                       toDate:now
                                       options:0];
    return [ageComponents year];
}

- (NSString *)getPhotoURL {
    return [NSString stringWithFormat:@"patient_%ld.png", (long)self.pID];
}

@end

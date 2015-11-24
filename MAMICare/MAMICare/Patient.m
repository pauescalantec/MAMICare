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

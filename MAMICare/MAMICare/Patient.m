//
//  NSObject+City.m
//  SPROC-Test
//
//  Created by Natalia García on 11/13/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (id) initWithID: (NSInteger *) pID andName: (NSString *) name andLastName: (NSString *) lastname1 {
        self = [super init];
        if (self) {
                self.pID = pID;
                self.name = name;
                self.lastname1 = lastname1;
        }
        return self;
}

@end

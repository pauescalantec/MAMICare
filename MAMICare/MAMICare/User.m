//
//  User.m
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithName:(NSString *)name lastName:(NSString *)last oid:(NSUInteger)oid age:(NSInteger)age street:(NSString *)st streetNumber:(NSInteger)stNum municipality:(NSString *)mun city:(NSString *)city state:(NSString *)state createdAt:(NSDate *)createdAt {
        self = [super init];
        if (self) {
                _firstName = name;
                _lastName = last;
                _oid = oid;
                _age = age;
                _street = st;
                _streetNumber = stNum;
                _municipality = mun;
                _city = city;
                _state = state;
                _createdAt = createdAt;
        }
        return self;
}

- (NSString*) getFullName {
        NSString *format = @"%@ %@";
        NSString *fullName = [NSString stringWithFormat: format, self.firstName, self.lastName];
        
        return fullName;
}

- (NSString *) getFullAddress {
        NSString *format = @"%@ %@ %@ %@ %@";
        NSString *fullAddress = [NSString stringWithFormat: format, self.street, self.streetNumber, self.municipality, self.city, self.state];
        return fullAddress;
}
@end

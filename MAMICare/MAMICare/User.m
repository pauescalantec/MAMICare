//
//  User.m
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "User.h"

@implementation User
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

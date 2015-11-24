
//
//  Address.m
//  SPROC-Test
//
//  Created by Natalia García on 11/19/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Address.h"

@implementation Address
-(BOOL) save {
        NSString *querySQL = [NSString stringWithFormat:
                              @"INSERT INTO Address (addressLine1, addressLine2, city, state, country, zipCode) VALUES ('%@', '%@', '%@', '%@', '%@', %d)", self.addressLine1, self.addressLine2, self.city, self.state, self.country, self.zipCode];
        if ([[DBManager getSharedInstance] updateDB:querySQL] > 0) {
                self.pID = [[DBManager getSharedInstance] getLastId];
                return YES;
        }
        return NO;
}

-(id) load {
    NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM Address WHERE id=%d", self.pID];
    NSMutableDictionary *resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
    int max = [[resultSet objectForKey:@"id"] count];
    for (int i = 0; i < max; i++) {
        if (![[[resultSet objectForKey:@"addressLine1"] objectAtIndex:i] isEqualToString: @";"]) {
            self.addressLine1 = [[resultSet objectForKey:@"addressLine1"] objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"addressLine2"] objectAtIndex:i] isEqualToString: @";"]) {
            self.addressLine2 = [[resultSet objectForKey:@"addressLine2"] objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"city"] objectAtIndex:i] isEqualToString: @";"]) {
            self.city = [[resultSet objectForKey:@"city"] objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"state"] objectAtIndex:i] isEqualToString: @";"]){
            self.state = [[resultSet objectForKey:@"state"] objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"country"] objectAtIndex:i] isEqualToString: @";"]) {
            self.country = [[resultSet objectForKey:@"country"] objectAtIndex:i];
        }
        if (![[[resultSet objectForKey:@"zipCode"] objectAtIndex:i] isEqualToString: @";"]) {
            self.zipCode = [[[resultSet objectForKey:@"zipCode"] objectAtIndex:i] integerValue];
        }
        if (![[[resultSet objectForKey:@"createdAt"] objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"createdAt"] objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            self.createdAt = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        }
    }
    return self;
}

@end

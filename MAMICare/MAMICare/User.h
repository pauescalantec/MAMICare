//
//  User.h
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property NSUInteger oid;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property NSInteger age;
@property (nonatomic, strong) NSString *street;
@property NSInteger streetNumber;
@property (nonatomic, strong) NSString *municipality;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSDate *createdAt;

-(NSString*) getFullName;
-(NSString*) getFullAddress;
-(id) initWithName: (NSString *) name
        lastName: (NSString *) last
        oid: (NSUInteger) oid
        age: (NSInteger) age
        street: (NSString *) st
        streetNumber: (NSInteger) stNum
        municipality: (NSString *) mun
        city: (NSString *) city
        state: (NSString *) state
        createdAt: (NSDate *) createdAt;
@end

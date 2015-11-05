//
//  Patient.h
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StatusReport.h"
#import "User.h"

@interface Patient : User
@property NSUInteger pid;
@property NSUInteger userId;
@property NSInteger babiesDelivered;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *community;
@property UIImage *photo;

- (StatusReport*) getMostRecentReport;
- (id) initWithPid: (NSUInteger) pid
        name: (NSString *) name
        lastName: (NSString *) last
        oid: (NSUInteger) oid
        age: (NSInteger) age
        street: (NSString *) st
        streetNumber: (NSInteger) stNum
        municipality: (NSString *) mun
        city: (NSString *) city
        state: (NSString *) state
        createdAt: (NSDate *) createdAt
        babiesDelivered: (NSInteger) babies
        status: (NSString *) stat
        community: (NSString *) comm
        photo: (UIImage *) photo;
@end

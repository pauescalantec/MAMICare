//
//  Address.h
//  SPROC-Test
//
//  Created by Natalia García on 11/19/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject

@property NSInteger pID;
@property (nonatomic, strong) NSString * addressLine1;
@property (nonatomic, strong) NSString * addressLine2;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * curp;
@property (nonatomic, strong) NSString * country;
@property NSInteger zipCode;
@property (nonatomic, strong) NSDate * createdAt;

@end

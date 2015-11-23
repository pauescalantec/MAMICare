//
//  City.h
//  SPROC-Test
//
//  Created by Natalia García on 11/13/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface Patient : NSObject

@property NSInteger pID;
@property NSInteger addressID;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * lastname1;
@property (nonatomic, strong) NSString * lastname2;
@property (nonatomic, strong) NSDate * birthDate;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * curp;
@property (nonatomic, strong) NSString * comments;
@property BOOL * isActive;
@property (nonatomic, strong) UIEvent * createdAt;


//methods
- (id) initWithID: (NSInteger) pID andName: (NSString *) name andLastName: (NSString *) lastname1;
- (NSString *)getFullName;

@end

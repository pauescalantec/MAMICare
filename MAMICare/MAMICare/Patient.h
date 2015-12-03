//
//  Patient.h
//  SPROC-Test
//
//  Created by Natalia García on 11/13/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Address.h"

extern NSMutableArray *patientArray;

@interface Patient : NSObject

@property NSInteger pID;
@property Address* pAddress;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * lastname1;
@property (nonatomic, strong) NSString * lastname2;
@property (nonatomic, strong) NSDate * birthDate;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * curp;
@property (nonatomic, strong) NSString * comments;
@property BOOL isActive;
@property (nonatomic, strong) NSDate * createdAt;

// special property for image
@property (nonatomic, strong) NSString * imageAssetURL;

//methods
- (id) initWithID: (NSInteger) pID andName: (NSString *) name andLastName: (NSString *) lastname1;
- (NSString *)getFullName;
- (NSInteger)getAge;
+ (void) loadAllPatients;
- (void)setBirthDateFromString:(NSString *)strDate;
- (NSString *)getStringBirthDate;
- (BOOL) save;
-(NSMutableArray*) loadAllAssessments;

@end

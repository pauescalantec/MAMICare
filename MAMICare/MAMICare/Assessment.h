//
//  Assessment.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "DBManager.h"
#import <Foundation/Foundation.h>

@interface Assessment : NSObject

// Attributes
@property NSInteger pID;

@property CGFloat weight;
@property NSInteger pulse;
@property NSInteger systolicHeartRate;
@property NSInteger diastolicHeartRate;
@property CGFloat fundalHeight;

@property CGFloat urineTest;
@property NSInteger basalGlucose;
@property NSInteger oxygen;

@property NSInteger fetalHeartBeat;
@property NSInteger fetalRegion;
@property BOOL contractionsExist;
@property NSInteger contractionsTime;
@property (nonatomic, strong) NSString *observations;

@property NSDate *startTime;
@property NSDate *endTime;
@property NSDate *lastModified;

// Methods
- (id)init;
- (BOOL)physicalFieldsCompleted;
- (BOOL)chemicalFieldsCompleted;
- (BOOL)fetusFieldsCompleted;
- (BOOL)save;

@end

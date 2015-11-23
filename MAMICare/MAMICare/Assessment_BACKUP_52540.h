//
//  Assessment.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Assessment : NSObject
<<<<<<< HEAD
@property NSInteger * pID;
@property NSDate * startTime;
@property NSDate * endTime;
@property NSInteger * pulse;
@property NSInteger * oxygen;
@property NSInteger * systolicHeartRate;
@property NSInteger * diastolicHeartRate;
@property NSInteger * fetalHeartBeat;
@property NSInteger * fetalRegion;
@property CGFloat urineTest;
@property BOOL contractionsExist;
@property NSInteger * contractionsTime;
@property CGFloat * weight;
@property CGFloat * fundalHeight;
@property NSInteger * basalGlucose;
@property (nonatomic, strong) NSString * observations;
@property BOOL isActive;
@property NSDate * lastModified;
=======

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
>>>>>>> 553c2454538e78b91437f6eeb3b41dfdc53979bd

@end

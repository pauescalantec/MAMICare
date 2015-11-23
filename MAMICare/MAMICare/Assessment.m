//
//  Assessment.m
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Assessment.h"

@implementation Assessment

- (id)init {
    self = [super init];
    if (self) {
        _pID = -1; // careful with the database here
        _weight = 0.0;
        _pulse = 0;
        _systolicHeartRate = 0;
        _diastolicHeartRate = 0;
        _fundalHeight = 0.0;

        _urineTest = 0;
        _basalGlucose = 0;
        _oxygen = 0;
       
        _fetalHeartBeat = 0;
        _fetalRegion = 0;
        _contractionsExist = NO;
        _contractionsTime = 0;
        _observations = @"";
        
        _startTime = [NSDate date];
        _endTime = nil;
        _lastModified = [NSDate date];
        
    }
    return self;
}

- (BOOL)physicalFieldsCompleted {
    BOOL a = (_weight != 0.0);
    BOOL b = (_pulse != 0);
    BOOL c = (_systolicHeartRate != 0);
    BOOL d = (_diastolicHeartRate != 0);
    BOOL e = (_fundalHeight != 0.0);
    return  a && b && c && d && e;
}

- (BOOL)chemicalFieldsCompleted {
    BOOL a = (_urineTest != 0);
    BOOL b = (_basalGlucose != 0);
    BOOL c = (_oxygen != 0);
    return a && b && c;
}

- (BOOL)fetusFieldsCompleted {
    BOOL a = (_fetalHeartBeat != 0);
    BOOL b = (_fetalRegion != 0);
    BOOL c = (_contractionsExist);
    BOOL d = (_contractionsTime != 0);
    BOOL e = (![_observations isEqualToString:@""]);
    return  a && b && c && d && e;
}

@end


//
//  Assessment.m
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Assessment.h"
#import "Consultation.h"

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
    BOOL d = (_contractionsExist) ? (_contractionsTime != 0) : true;
    BOOL e = (![_observations isEqualToString:@""]);
    return  a && b && d && e;
}

- (BOOL) save {
    NSString *querySQL = [NSString stringWithFormat:
                          @"INSERT INTO Assessment (startTime, pulse, oxygen, systolicHeartRate,diastolicHeartRate, fetalHeartBeat, fetalRegion, urineTest, contractionsExist, contractionsTime, weight, fundalHeight, basalGlucose, observations) VALUES ('%@',%d, %d, %d, %d, %d, %d, %f, %d, %d, %f, %f, %d, '%@')", self.startTime, self.pulse, self.oxygen, self.systolicHeartRate, self.diastolicHeartRate, self.fetalHeartBeat, self.fetalRegion, self.urineTest, self.contractionsExist, self.contractionsTime, self.weight, self.fundalHeight, self.basalGlucose, self.observations];
    if ([[DBManager getSharedInstance] updateDB:querySQL] > 0) {
        self.pID = [[DBManager getSharedInstance] getLastId];
        return YES;
    }
    return NO;
}

+(NSMutableArray*) loadAllAssessments {
    NSMutableArray *assessmentArray = [[NSMutableArray alloc] init];
    Assessment *tmpAssessment = [[Assessment alloc] init];
    
    NSString *querySQL = @"SELECT * FROM Assessment";
    NSMutableDictionary *resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
    int max = [[resultSet objectForKey:@"id"] count];
    for(int i = 0; i < max; i++) {
        tmpAssessment.pID = [[[resultSet objectForKey:@"id"] objectAtIndex:i] integerValue];
        
        if (![[[resultSet objectForKey:@"startTime"]objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"startTime"]objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            tmpAssessment.startTime = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        }
        
        if (![[[resultSet objectForKey:@"endTime"] objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"endTime"]objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            tmpAssessment.endTime = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
        }
        
        if (![[[resultSet objectForKey:@"pulse"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.pulse = [[[resultSet objectForKey:@"pulse"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"oxygen"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.oxygen = [[[resultSet objectForKey:@"oxygen"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"systolicHeartRate"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.systolicHeartRate = [[[resultSet objectForKey:@"systolicHeartRate"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"diastolicHeartRate"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.diastolicHeartRate = [[[resultSet objectForKey:@"diastolicHeartRate"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"fetalHeartBeat"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.fetalHeartBeat = [[[resultSet objectForKey:@"fetalHeartBeat"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"fetalRegion"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.fetalRegion = [[[resultSet objectForKey:@"fetalRegion"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"urineTest"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.urineTest = [[[resultSet objectForKey:@"urineTest"] objectAtIndex:i] floatValue];
        }
        
        if (![[[resultSet objectForKey:@"contractionsExist"]objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.contractionsExist = ([[[resultSet objectForKey:@"contractionsExist"]objectAtIndex:i] integerValue] != 0);
        }
        
        if (![[[resultSet objectForKey:@"contractionsTime"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.contractionsTime = [[[resultSet objectForKey:@"contractionsTime"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"weight"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.weight = [[[resultSet objectForKey:@"weight"] objectAtIndex:i] floatValue];
        }
        
        if (![[[resultSet objectForKey:@"fundalHeight"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.fundalHeight = [[[resultSet objectForKey:@"fundalHeight"] objectAtIndex:i] floatValue];
        }
        
        if (![[[resultSet objectForKey:@"basalGlucose"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.basalGlucose = [[[resultSet objectForKey:@"basalGlucose"] objectAtIndex:i] integerValue];
        }
        
        if (![[[resultSet objectForKey:@"observations"] objectAtIndex:i] isEqualToString: @";"]) {
            tmpAssessment.observations = [[resultSet objectForKey:@"observations"] objectAtIndex:i];
        }
        
        if (![[[resultSet objectForKey:@"lastModified"]objectAtIndex:i] isEqualToString: @";"]) {
            NSString *epochString  = [[resultSet objectForKey:@"lastModified"]objectAtIndex:i];
            epochString = [epochString stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSTimeInterval seconds = [epochString doubleValue];
            tmpAssessment.lastModified = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
            NSLog(tmpAssessment.lastModified);
        }
        [assessmentArray addObject:tmpAssessment];
        tmpAssessment = [[Assessment alloc] init];
    }
    return assessmentArray;
}


@end


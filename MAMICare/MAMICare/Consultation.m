//
//  Consultation.m
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "Consultation.h"

@implementation Consultation
- (BOOL) save {
    NSString *querySQL = [NSString stringWithFormat:
                          @"INSERT INTO Consultation (assessmentID, patientID, socialWorkerID, overallScore) VALUES (%d, %d, %d, %f)", self.assessmentID, self.patientID, self.socialWorkerID, self.overallScore];
    if ([[DBManager getSharedInstance] updateDB:querySQL] > 0) {
        self.pID = [[DBManager getSharedInstance] getLastId];
        return YES;
    }
    return NO;
}

@end

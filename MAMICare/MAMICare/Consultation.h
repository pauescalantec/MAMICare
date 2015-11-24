//
//  Consultation.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import "Patient.h"
#import "SocialWorker.h"
#import "Assessment.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Consultation : NSObject

@property NSInteger pID;
@property NSInteger assessmentID;
@property NSInteger patientID;
@property NSInteger socialWorkerID;
@property NSDate * createdAt;
@property CGFloat overallScore;

- (BOOL)save;
@end

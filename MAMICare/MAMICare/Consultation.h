//
//  Consultation.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Consultation : NSObject

@property NSInteger * pID;
@property NSInteger * assessmentID;
@property NSInteger * patientID;
@property NSInteger * socialWorkerID;
@property UIEvent * createdAt;
@property CGFloat overallScore;

@end

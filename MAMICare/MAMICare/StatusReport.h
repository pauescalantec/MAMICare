//
//  StatusReport.h
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusReport : NSObject
@property NSUInteger oid;
@property NSUInteger patientId;
@property double oxygenLevels;
@property double heartRate;
@property (nonatomic, strong) NSString *positionOfFetus;
@property NSInteger urineColor;
@property BOOL nausea;
@property double glucoseLevels;
@property double measuredWeight;

- (double) getOverallScore;

@end

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
@property NSInteger * pID;
@property UIEvent * startTime;
@property UIEvent * endTime;
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
@property UIEvent * lastModified;

@end

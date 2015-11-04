//
//  Consultation.h
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Consultation : NSObject
@property NSUInteger oid;
@property NSUInteger patientId;
@property (nonatomic, strong) NSDate *createdAt;
@property double overallScore;

- (NSString *) getShortSummary;
@end

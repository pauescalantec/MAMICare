//
//  Patient.h
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StatusReport.h"

@interface Patient : NSObject
@property NSUInteger oid;
@property NSUInteger userId;
@property NSInteger babiesDelivered;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *community;
@property UIImage *photo;

- (StatusReport*) getMostRecentReport;
@end

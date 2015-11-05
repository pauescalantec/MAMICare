//
//  Patient.m
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "Patient.h"

@implementation Patient

-(id) initWithPid:(NSUInteger)pid name:(NSString *)name lastName:(NSString *)last oid:(NSUInteger)oid age:(NSInteger)age street:(NSString *)st streetNumber:(NSInteger)stNum municipality:(NSString *)mun city:(NSString *)city state:(NSString *)state createdAt:(NSDate *)createdAt babiesDelivered:(NSInteger)babies status:(NSString *)stat community:(NSString *)comm photo:(UIImage *)photo {
        
        self = [super initWithName:name lastName:last oid:oid age:age street:st streetNumber:stNum municipality:mun city:city state:state createdAt:createdAt];
        if (self) {
                _pid = pid;
                _babiesDelivered = babies;
                _status = stat;
                _community = comm;
                _photo = photo;
        }
        return self;
}

- (StatusReport*) getMostRecentReport {
        StatusReport *report;
        //query que le mandas oid del patient order by date
        //y lo pones en un status report
        return report;
}
@end

//
//  SocialWorker.m
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//

#import "SocialWorker.h"

@implementation SocialWorker

+ (BOOL)loginwithName: (NSString*) username andPassword: (NSString*) password {
    NSString *querySQL = [NSString stringWithFormat: @"SELECT id FROM SocialWorker WHERE username = '%@' AND password = '%@'", username, password];
    if (!currentUser) {
        currentUser = [[SocialWorker alloc] init];
    }
    NSMutableDictionary *resultSet = [[DBManager getSharedInstance] queryDB:querySQL];
    if ([[resultSet objectForKey:@"id"] firstObject] && ![[[resultSet objectForKey:@"id"] firstObject] isEqualToString:@";"]) {
        currentUser.pID = [[[resultSet objectForKey:@"id"] firstObject] integerValue];
        currentUser.username = username;
        currentUser.password = password;
        return YES;
    }
    return NO;
}



@end

//
//  SocialWorker.h
//  MAMICare
//
//  Created by Natalia García on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocialWorker : NSObject
@property NSUInteger oid;
@property NSUInteger userId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *title;

- (BOOL) authorize: (SocialWorker *) socialWorker withUsername:(NSString *) username andPassword:(NSString *) password;
@end

//
//  SocialWorker.h
//  SPROC-Test
//
//  Created by Natalia García on 11/17/15.
//  Copyright © 2015 Natalia Garcia. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DBManager.h"

@interface SocialWorker : NSObject

@property NSInteger pID;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * lastname;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSDate * createdAt;

+ (BOOL)loginwithName: (NSString*) username andPassword: (NSString*) password;

@end

extern SocialWorker *currentUser;

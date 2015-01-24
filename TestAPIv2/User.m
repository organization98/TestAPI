//
//  User.m
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "User.h"

@implementation User

+ (User *)userFromDictionary:(NSDictionary *)dictionary {
    User *user = [[User alloc] init];
    user.result = [dictionary objectForKey:@"result"];
    user.session = [dictionary objectForKey:@"session"];
    return user;
}

- (NSDictionary *)dictionaryFromUser {
    NSDictionary *userDict = [NSDictionary dictionaryWithObjectsAndKeys:
                              self.result, @"result",
                              self.session, @"session",
                              nil];
    return userDict;
}

@end
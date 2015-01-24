//
//  User.h
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *result;
@property (strong, nonatomic) NSString *session;

+ (User *)userFromDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionaryFromUser;

@end

//
//  User.h
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject

// Авторизация (auth)
@property (strong, nonatomic) NSString *result;
@property (strong, nonatomic) NSString *session;

+ (Response *)responseFromDictionary:(NSDictionary *)dictionary;
+ (NSDictionary *)reservePost;

@end

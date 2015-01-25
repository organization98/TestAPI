//
//  User.m
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "Response.h"

@implementation Response

+ (Response *)userFromDictionary:(NSDictionary *)dictionary {
    Response *user = [[Response alloc] init];
    user.result = [dictionary objectForKey:@"result"];
    user.session = [dictionary objectForKey:@"session"];
    return user;
}

+ (NSDictionary *)reservePost {
    NSDictionary *lugagge = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"A",               @"kind",
                                @"45",              @"weight",
                                nil];
    
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"booking",         @"buy",
                                @"full",            @"type",
                                @"Taras",           @"firstname",
                                @"Bulba",           @"lastname",
                                @"1",               @"transportation",
                                lugagge,            @"lugagge",
                                nil];
    
    NSDictionary *places = [NSDictionary dictionaryWithObjectsAndKeys:
                                paramsDict,         @"011",
                                nil];

    NSLog(@"%@", places);
    
    return places;
}

@end
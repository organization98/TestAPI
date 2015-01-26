//
//  SessionManager.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "SessionManager.h"




@implementation SessionManager {
    
    

    NSString *username;
    
    NSString *password;

    NSString *session;
    
    NSString *domain;
    
    BOOL isOpen;
}

+ (SessionManager *)sharedManager {
    static SessionManager *manager = nil;
    static dispatch_once_t onceTaken;
    dispatch_once (& onceTaken, ^{
        manager = [SessionManager new];
    });    
    return manager;
}

- (id)init {
    self = [super init];
    if (self) {
        username = @"demo";
        password = @"demo";
        domain = @"http://booking.ibp.org.ua/api/";
        [self open];
    }
    return self;
}

-(void)open {
    if (!isOpen) {
        //Выполнить транзакцию авторизации, сохраниить сессию
        isOpen = YES;
        return;
    }
    return;
}

-(NSArray *)getRoutes:(NSString *)stationFrom to:(NSString *)stationTo {
    
    // выполнение транзакции
    return [NSArray new];
}

-(NSArray *)getPrices:(NSString *)train withType:(NSString *)type andClass:(NSString *)cls {
    
    return [NSArray new];
}

-(NSDictionary *)getPlaces:(NSString *)train withType:(NSString *)type andClass:(NSString *)cls {
    
    return [NSDictionary new];
}

@end

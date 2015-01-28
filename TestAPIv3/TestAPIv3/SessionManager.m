//
//  SessionManager.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "SessionManager.h"
#import "AFNetworking.h"


@interface SessionManager ()

@end

@implementation SessionManager {
    NSString *username;
    NSString *password;
    NSString *session;
    NSString *domain;
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
        domain = @"http://booking.ibp.org.ua/api";
    }
    return self;
}

- (void)requestFromURL:(NSURL *)url completion:(NetworkBlock)block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url.absoluteString parameters:nil success:
     ^(AFHTTPRequestOperation *operation, id responseObject) {
         // проверка RESULT
         if ([[responseObject objectForKey:@"result"] isEqual:@"OK"]) {
             block (YES, responseObject, nil);
         } else if ([[responseObject objectForKey:@"result"] isEqual:@"ERROR"]) {
             NSDictionary *errorDict = @{@"message" : [responseObject objectForKey:@"message"]};
             NSError *error = [NSError errorWithDomain:@"booking.ibp.org.ua" code:(NSInteger)[responseObject objectForKey:@"code"] userInfo:errorDict];
             block (NO, responseObject, error);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", operation);
     }];
}

- (void)open:(NetworkBlock)block {
    if(session.length >  0){
        block (YES, nil, nil);
        return;
    }
    // Выполнить транзакцию авторизации, сохраниить сессию
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/auth?username=%@&password=%@", domain, username, password]];
    [self requestFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        if ([[data objectForKey:@"result"] isEqual:@"OK"]) {
            session = [data objectForKey:@"session"];
            block (succes, data, error);
        }
        NSLog(@"\nавторизация\nresult: %@\nsession: %@", [data objectForKey:@"result"], session);
    }];
    return;
}

- (void)getRoutes:(NSString *)stationFrom to:(NSString *)stationTo and:(NetworkBlock)block {
    
    // добавить в параметры дату
    
    // выполнение транзакции "trains"
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *tomorrow = [[NSDate date] dateByAddingTimeInterval:60 * 60 * 24 * 1];
    NSString *startDate = [dateFormatter stringFromDate:tomorrow];
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/trains?from=%@&to=%@&startDate=%@&session=%@", domain, stationFrom, stationTo, startDate, session]];
    [self requestFromURL:requestURL completion:^(BOOL succes, id data, NSError *error) {
        if (succes == NO) {
            NSLog(@"%@", [[error userInfo] objectForKey:@"message"]);
        } else {
            block (succes, data, error);
        }
    }];
}

- (NSArray *)getPrices:(NSString *)train withType:(NSString *)type andClass:(NSString *)cls {
    return [NSArray new];
}

- (NSDictionary *)getPlaces:(NSString *)train withType:(NSString *)type andClass:(NSString *)cls {
    return [NSDictionary new];
}

@end
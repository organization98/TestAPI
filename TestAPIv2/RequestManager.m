//
//  RequestManager.m
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"
#import "MyStyleKit.h"


@implementation RequestManager

+ (RequestManager *)sharedManager {
    static RequestManager *manager = nil;
    static dispatch_once_t onceTaken;
    dispatch_once (& onceTaken, ^{
        manager = [RequestManager new];
    });
    return manager;
}

// Authorization
- (void)authorizationFromURL:(NSURL *)url completion:(NetworkBlock)block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url.absoluteString parameters:nil success:
     ^(AFHTTPRequestOperation *operation, id responseObject) {
         NSError *error;
         NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                            options:NSJSONWritingPrettyPrinted
                                                              error:&error];
         if (!jsonData) {
             [MyStyleKit alertWithMessage:[NSString stringWithFormat:@"Got an error: %@", error]];
         } else {
             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:&error];
             // проверка RESULT
             NSString *resultFromJSON = [jsonDictionary objectForKey:@"result"];
             NSInteger codeFromJSON = [[jsonDictionary objectForKey:@"code"] integerValue];
             NSString *message = [jsonDictionary objectForKey:@"message"];
             
             if ([resultFromJSON isEqual:@"OK"]) {
                 block (YES, jsonDictionary, nil);
                 
             } else if ([resultFromJSON isEqual:@"ERROR"]) {
                 NSDictionary *errorDict = @{@"message" : message};
                 NSError *error = [NSError errorWithDomain:@"booking.ibp.org.ua" code:codeFromJSON userInfo:errorDict];
                 block (NO, jsonDictionary, error);
             }
             //
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         //[MyStyleKit alertWithMessage:[NSString stringWithFormat:@"%@", error]];
         NSLog(@"%@", operation);
     }];
}

// Reserve
- (void)reserveFromURL:(NSString *)url completion:(NetworkBlock)block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *param = [Response reservePost];
    [manager POST:url parameters:param success:
     ^(AFHTTPRequestOperation *operation, id responseObject) {
        //Обработка responseObject
        block(YES, responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MyStyleKit alertWithMessage:[NSString stringWithFormat:@"%@", error]];
    }];
}


//Возвращает массив пользователей
/*
- (NSArray *)usersFromData:(id)data {
    NSMutableArray *users = [NSMutableArray array];
    for (NSDictionary *dict in data){
        Response *user = [Response responseFromDictionary:dict];
        [users addObject:user];
    }
    return users;
}
*/

@end
//
//  RequestManager.m
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"


@implementation RequestManager

+ (RequestManager *)sharedManager {
    static RequestManager *manager = nil;
    static dispatch_once_t onceTaken;
    dispatch_once (& onceTaken, ^{
        manager = [RequestManager new];
    });
    return manager;
}

- (void)alertWith:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

//Получение списка пользователей
- (void)loadDataFromURL:(NSURL *)url completion:(NetworkBlock)block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url.absoluteString parameters:nil success:
     ^(AFHTTPRequestOperation *operation, id responseObject) {
         NSError *error;
         NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                            options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                              error:&error];
         
         if (!jsonData) {
             [self alertWith:[NSString stringWithFormat:@"Got an error: %@", error]];
         } else {
             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:&error];
             block (YES, jsonDictionary, nil);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self alertWith:[NSString stringWithFormat:@"%@", error]];
     }];
}

//Сохранение пользователя
- (void)reserve:(NSString *)url completion:(NetworkBlock)block {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *param = [Response reservePost];
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //Обработка responseObject
        block(YES, responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self alertWith:[NSString stringWithFormat:@"%@", error]];
    }];
}


//Возвращает массив пользователей
- (NSArray *)usersFromData:(id)data {
    NSMutableArray *users = [NSMutableArray array];
    for (NSDictionary *dict in data){
        Response *user = [Response userFromDictionary:dict];
        [users addObject:user];
    }
    return users;
}

@end
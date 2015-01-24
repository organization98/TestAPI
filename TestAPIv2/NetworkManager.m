//
//  NetworkManager.m
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"


@implementation NetworkManager

+ (NetworkManager *)sharedManager {
    static NetworkManager *manager = nil;
    static dispatch_once_t onceTaken;
    dispatch_once (& onceTaken, ^{
        manager = [NetworkManager new];
    });
    return manager;
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
             NSLog(@"Got an error: %@", error);
         } else {
             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:&error];
             NSLog(@"jsonDictionary\n\n%@", jsonDictionary);
             block (YES, jsonDictionary, nil);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@", error);
     }];
}

//Сохранение пользователя
- (void)saveUser:(User *)user completion:(NetworkBlock)block {
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    NSDictionary* param = [user dictionaryFromUser];
    [manager POST:@"https://domain/api/transactionname?param=value&param2=value&session=akenbrbbr9b3r7d vo3t33ih0f7" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"USER SAVED\n%@", responseObject); //Обработка сохранения пользователя
        User *user = [User userFromDictionary:responseObject];
        block(YES, user, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //Обработка ошибки
    }];
}


//Возвращает массив пользователей
- (NSArray *)usersFromData:(id)data {
    NSMutableArray *users = [NSMutableArray array];
    for (NSDictionary *dict in data){
        User *user = [User userFromDictionary:dict];
        [users addObject:user];
    }
    return users;
}

@end
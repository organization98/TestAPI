//
//  NetworkManager.h
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "User.h"

typedef  void (^NetworkBlock)(BOOL succes, id data, NSError* error);

@interface NetworkManager : NSObject

+ (NetworkManager *)sharedManager;
- (void)loadDataFromURL:(NSURL *)url completion:(NetworkBlock) block;
- (void)saveUser:(User *)user completion:(NetworkBlock) block;

@end
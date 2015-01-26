//
//  RequestManager.h
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainController.h"
#import "Response.h"

typedef  void (^NetworkBlock)(BOOL succes, id data, NSError* error);

@interface RequestManager : NSObject

+ (RequestManager *)sharedManager;
- (void)authorizationFromURL:(NSURL *)url completion:(NetworkBlock) block;
- (void)reserveFromURL:(NSString *)url completion:(NetworkBlock)block;

@end
//
//  RequestManager.h
//  TestAPI
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "Response.h"

typedef  void (^NetworkBlock)(BOOL succes, id data, NSError* error);

@interface RequestManager : NSObject

+ (RequestManager *)sharedManager;
- (void)loadDataFromURL:(NSURL *)url completion:(NetworkBlock) block;
- (void)reserve:(NSString *)url completion:(NetworkBlock)block;

@end
//
//  MyStyleKit.m
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/25/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "MyStyleKit.h"
#import <UIKit/UIAlertView.h>

@implementation MyStyleKit

+ (void)alertWithMessage:(NSString *)string {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:string
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
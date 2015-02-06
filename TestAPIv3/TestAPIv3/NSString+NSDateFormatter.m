//
//  NSString+NSDateFormatter.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 02/06/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "NSString+NSDateFormatter.h"

@implementation NSString (NSDateFormatter)

+ (NSString *)dateFromString:(NSString *)string {
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"YYYY-MM-DD HH:MM:SS"];
    
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormater dateFromString:string];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"EE, D MMM, hh:mm"];
    
    return [dateFormatter2 stringFromDate:dateFromString];
}

@end
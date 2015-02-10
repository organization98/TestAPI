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
    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // YYYY-MM-DD hh:mm:ss
    
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormater dateFromString:string];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"EE, d MMM, HH:mm"];
    
    return [dateFormatter2 stringFromDate:dateFromString];
}

+ (NSString *)travelTimeFromString:(NSString *)string {
    NSArray *array = [string componentsSeparatedByString:@":"];
    NSString *hours = [array objectAtIndex:0];
    NSString *mins = [array objectAtIndex:1];
    return [NSString stringWithFormat:@"%li ч : %li м", [hours integerValue], [mins integerValue]];
}

@end
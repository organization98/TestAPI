//
//  Route.h
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *stationFrom;
@property (strong, nonatomic) NSString *stationTo;
@property (strong, nonatomic) NSString *classTrain;
@property (strong, nonatomic) NSString *fasted;
@property (strong, nonatomic) NSString *departureDate;
@property (strong, nonatomic) NSString *arrivalDate;
@property (strong, nonatomic) NSString *travelTime;
@property (strong, nonatomic) NSString *departureDateArray;
@property (strong, nonatomic) NSString *arrivalDateArray;
@property (strong, nonatomic) NSString *travelTimeAarray;
@property (strong, nonatomic) NSString *wagonType;
@property (strong, nonatomic) NSString *countPlaces;

+ (Route *)routeFromDictionary:(NSDictionary *)dictionary;

@end
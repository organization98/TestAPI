//
//  Route.m
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "Route.h"

@implementation Route

+ (Route *)routeFromDictionary:(NSDictionary *)dictionary {
    
    Route *route = [[Route alloc] init];
    
    route.number = [dictionary objectForKey:@"number"];
    route.model = [dictionary objectForKey:@"model"];
    route.category = [dictionary objectForKey:@"category"];
    route.stationFrom = [dictionary objectForKey:@"station_from"];
    route.stationTo = [dictionary objectForKey:@"station_to"];
    route.classTrain = [dictionary objectForKey:@"class"];
    route.fasted = [dictionary objectForKey:@"fasted"];
    route.departureDate = [dictionary objectForKey:@"departure_date"];
    route.arrivalDate = [dictionary objectForKey:@"arrival_date"];
    route.travelTime = [dictionary objectForKey:@"travel_time"];
    route.departureDateArray = [dictionary objectForKey:@"departure_date_array"]; // dict
    route.arrivalDateArray = [dictionary objectForKey:@"arrival_date_array"]; // dict
    route.travelTimeAarray = [dictionary objectForKey:@"travel_time_array"]; // dict
    route.wagonType = [dictionary objectForKey:@"wagon_type"];
    route.countPlaces = [dictionary objectForKey:@"countPlaces"];
    
    return route;
}

@end

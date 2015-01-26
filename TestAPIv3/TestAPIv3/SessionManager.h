//
//  SessionManager.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^NetworkBlock)(BOOL succes, id data, NSError* error);

@interface SessionManager : NSObject


+ (SessionManager *)sharedManager;

-(void)open;

/*
    Get trainss
 */
-(NSArray *)getRoutes:(NSString *)stationFrom to:(NSString *)stationTo;

/*
 * Получить цены. Если передан только номер поезда - вернет цены на все типы вагонов этого поезда
   Если указан тип вагона, то вернет цену только на тип данного вагона. Если тип С
   то нужно указывать класс
 */
-(NSArray *)getPrices:(NSString *)train withType:(NSString *)type andClass:(NSString *)cls;



-(NSDictionary *)getPlaces:(NSString *)train withType:(NSString *)type andClass:(NSString *)cls;

@end
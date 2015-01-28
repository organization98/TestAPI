//
//  RoutesController.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "RoutesController.h"
#import "RoutesCustomCell.h"
#import "SessionManager.h"
#import "DejalActivityView.h"

@interface RoutesController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RoutesController {
    NSArray *routesArray;
    NSDictionary *route;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = NSStringFromClass([RoutesController class]);
    
    // ActivityView
    [self.tableView setHidden:YES];
    UIView *viewToUse = self.view;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [DejalActivityView activityViewForView:viewToUse];
    
    [[SessionManager sharedManager] open:^(BOOL succes, id data, NSError *error) {
        if (succes == NO) {
            return;
        }
        [self removeActivityView];
    }];
    
//    Routes *routes = [routes routeFromDictionary:data];
}

/*
  Показать таблицу, убрать загрузчик. Выполняет транзакцию получения рейсов
 */
- (void)removeActivityView {

    [[SessionManager sharedManager] getRoutes:self.stationFrom to:self.stationTo and:^(BOOL succes, id data, NSError *error) {
        if (!data)
            return;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&error];
//        Routes *routes = [Routes routeFromDictionary:dictionary];
        routesArray = [dictionary objectForKey:@"items"];
        [self.tableView reloadData];
        [DejalActivityView removeView];
        [self.tableView setHidden:NO];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

// сколько рядов в секции под индексом section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [routesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RoutesCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"RoutesCustomCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    }
    route = [routesArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@", [routesArray firstObject]);
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (NSDate *)getDateFromString:(NSString *)stringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *postDate = [dateFormatter dateFromString:stringDate];
    return postDate;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(RoutesCustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.number.text = [route objectForKey:@"number"];
    cell.model.text = [NSString stringWithFormat:@"%@ - %@", [route objectForKey:@"station_from"], [route objectForKey:@"station_to"]];
    
    // Блок время
    // EEE d MMM HH:MM"
//    NSLog(@"getDateFromString %@", [self getDateFromString:[route objectForKey:@"travel_time"]]);


    
    cell.departureDate.text = [route objectForKey:@"departure_date"];
    cell.arrivalDate.text = [route objectForKey:@"arrival_date"];
    cell.travelTime.text = [route objectForKey:@"travel_time"];
    
    cell.wagonType.text = [route objectForKey:@"wagon_type"];
    cell.countPlaces.text = [route objectForKey:@"count"];
    
    cell.clockImage.image = [UIImage imageNamed:@"pin-orange"];
}

@end
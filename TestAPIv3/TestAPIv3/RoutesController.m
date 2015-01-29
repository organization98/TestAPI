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
#import "PricesManager.h"
#import "DejalActivityView.h"

@interface RoutesController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RoutesController {
    NSArray *routesArray;
    NSDictionary *route;
    PricesManager *pricesManager;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = NSStringFromClass([RoutesController class]);
    
    pricesManager = [[PricesManager alloc] init];
    
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
}

- (void)removeActivityView2 {
    NSDictionary *dict = [[SessionManager sharedManager] getRoutesWithDictionary:self.stationFrom to:self.stationTo forStartDate:self.startDate and:^(BOOL succes, id data, NSError *error) {
        
    }];
    routesArray = [dict objectForKey:@"items"];
    [self.tableView reloadData];
    [DejalActivityView removeView];
    [self.tableView setHidden:NO];
    [self loadPrices];
}

// Показать таблицу, убрать загрузчик. Выполняет транзакцию получения рейсов
- (void)removeActivityView {
    [[SessionManager sharedManager] getRoutes:self.stationFrom to:self.stationTo forStartDate:self.startDate and:^(BOOL succes, id data, NSError *error) {
        if (!data)
            return;
        routesArray = [[self dictionaryFromJSON:data with:error] objectForKey:@"items"];
        [self.tableView reloadData];
        [DejalActivityView removeView];
        [self.tableView setHidden:NO];
        [self loadPrices];
    }];
}

- (void)loadPrices {
    
    NSString *train = @"079П";
    
    [[SessionManager sharedManager] getPrices:train withType:nil andClass:nil and:^(BOOL succes, id data, NSError *error) {
        if (!data) {
            return;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)dictionaryFromJSON:(NSData *)data with:(NSError *)error {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
}

- (NSDate *)getDateFromString:(NSString *)stringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *postDate = [dateFormatter dateFromString:stringDate];
    return postDate;
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
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(RoutesCustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.labelNumber.text = [route objectForKey:@"number"];
    cell.model.text = [NSString stringWithFormat:@"%@ - %@", [route objectForKey:@"station_from"], [route objectForKey:@"station_to"]];
    
    // Блок время
    // EEE d MMM HH:MM"
    
    cell.labelDepartureDate.text = [route objectForKey:@"departure_date"];
    cell.labelArrivalDate.text = [route objectForKey:@"arrival_date"];
    cell.labelTravelTime.text = [route objectForKey:@"travel_time"];
    
    cell.labelWagonType.text = [route objectForKey:@"wagon_type"];
    cell.labelCountPlaces.text = [route objectForKey:@"count"];
    
    cell.clockImage.image = [UIImage imageNamed:@"pin-orange"];
    
    
    cell.trainNumber = [route objectForKey:@"number"];
    cell.wagonType = [route objectForKey:@"wagon_type"];

    cell.labelCost.text = nil;
    
    [[NSNotificationCenter defaultCenter] addObserver:cell selector:@selector(updatePrice:) name:cell.labelNumber.text object:pricesManager];
    
    if([pricesManager getPrice:cell.trainNumber from:cell]){
        NSDictionary *prices = [pricesManager getPrice:cell.trainNumber from:cell];
        [cell addPriceToLabel:prices];
    }
    

}

@end
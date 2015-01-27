//
//  RoutesController.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "RoutesController.h"
#import "SessionManager.h"
#import "DejalActivityView.h"

@interface RoutesController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RoutesController {
    NSArray *routesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //--------------------------------------------------------------------------------------------
    
    [self.tableView setHidden:YES];
    UIView *viewToUse = self.view;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [DejalActivityView activityViewForView:viewToUse];
    
    //--------------------------------------------------------------------------------------------
    
    [[SessionManager sharedManager] open:^(BOOL succes, id data, NSError *error) {
        if (succes == NO) {
            return;
        }
        [self removeActivityView];
    }];
    
    
}

/*
  Показать таблицу, убрать загрузчик. Выполняет транзакцию получения рейсов
 */
-(void)removeActivityView{

    [[SessionManager sharedManager] getRoutes:self.stationFrom to:self.stationTo and:^(BOOL succes, id data, NSError *error) {
        if (!data)
            return;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&error];
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

// количество секций в таблице
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // выведено кол-во family
}

// сколько рядов в секции под индексом section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [routesArray count];
}

// имя section
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *familyNamesArray = [UIFont familyNames];
    
    NSString *familyNameString = [familyNamesArray objectAtIndex:section];
    
    return familyNameString;
}
*/


// возврат ячейки по indexPath и будет содержать: Section и Row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // переиспользование ячеек
    static NSString *indentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:indentifier];
        NSLog(@"cell created");
    }
    NSDictionary *route = [routesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [route objectForKey:@"number"];
    cell.detailTextLabel.text = [route objectForKey:@"fasted"];
    
    return cell;
}

@end
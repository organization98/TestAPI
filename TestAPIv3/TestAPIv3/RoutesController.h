//
//  RoutesController.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Routes.h"

@interface RoutesController : UIViewController

@property (strong, nonatomic) NSString *stationFrom;
@property (strong, nonatomic) NSString *stationTo;
@property (strong, nonatomic) NSDate *startDate;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
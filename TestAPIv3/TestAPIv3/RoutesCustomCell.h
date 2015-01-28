//
//  RoutesCustomCell.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/28/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoutesCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *model; // для названия маршрута
//@property (weak, nonatomic) IBOutlet UILabel *category;
//@property (weak, nonatomic) IBOutlet UILabel *stationFrom;
//@property (weak, nonatomic) IBOutlet UILabel *stationTo;
//@property (weak, nonatomic) IBOutlet UILabel *classTrain;
//@property (weak, nonatomic) IBOutlet UILabel *fasted;
@property (weak, nonatomic) IBOutlet UILabel *departureDate;
@property (weak, nonatomic) IBOutlet UILabel *arrivalDate;
@property (weak, nonatomic) IBOutlet UILabel *travelTime;
//@property (weak, nonatomic) IBOutlet UILabel *departureDateArray;
//@property (weak, nonatomic) IBOutlet UILabel *arrivalDateArray;
//@property (weak, nonatomic) IBOutlet UILabel *travelTimeAarray;
@property (weak, nonatomic) IBOutlet UILabel *wagonType;
@property (weak, nonatomic) IBOutlet UILabel *countPlaces;

@property (weak, nonatomic) IBOutlet UIImageView *clockImage;

@end
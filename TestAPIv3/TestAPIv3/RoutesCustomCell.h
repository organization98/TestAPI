//
//  RoutesCustomCell.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/28/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoutesCustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *activityView;

@property (strong, nonatomic)  UILabel *labelCost;

@property (weak, nonatomic) IBOutlet UILabel *labelNumber;
@property (weak, nonatomic) IBOutlet UILabel *model; // для названия маршрута
//@property (weak, nonatomic) IBOutlet UILabel *category;
//@property (weak, nonatomic) IBOutlet UILabel *stationFrom;
//@property (weak, nonatomic) IBOutlet UILabel *stationTo;
//@property (weak, nonatomic) IBOutlet UILabel *classTrain;
//@property (weak, nonatomic) IBOutlet UILabel *fasted;
@property (weak, nonatomic) IBOutlet UILabel *labelDepartureDate;
@property (weak, nonatomic) IBOutlet UILabel *labelArrivalDate;
@property (weak, nonatomic) IBOutlet UILabel *labelTravelTime;
//@property (weak, nonatomic) IBOutlet UILabel *departureDateArray;
//@property (weak, nonatomic) IBOutlet UILabel *arrivalDateArray;
//@property (weak, nonatomic) IBOutlet UILabel *travelTimeAarray;
@property (weak, nonatomic) IBOutlet UILabel *labelWagonType;
@property (weak, nonatomic) IBOutlet UILabel *labelCountPlaces;

@property (weak, nonatomic) IBOutlet UIImageView *clockImage;

@property (strong, nonatomic) NSString *wagonType;
@property (strong, nonatomic) NSString *trainNumber;

-(void)updatePrice:(NSNotification *)n;

- (void)addPriceToLabel:(NSDictionary *)dict;

@end
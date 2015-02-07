//
//  ViewController.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "MainController.h"
#import "RoutesController.h"
#import "SessionManager.h"
#import "DejalActivityView.h"
#import "UIColor+ConvertHEX.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.buttonFind.backgroundColor = [UIColor colorWithHexString:@"#F2854C"];
    self.buttonFind.tintColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.buttonFind.layer.cornerRadius = 5;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
    
    self.navigationItem.title = NSStringFromClass([MainController class]);
        
    // Picker
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.minimumDate = [NSDate date];
    self.datePicker.maximumDate = [[NSDate date] dateByAddingTimeInterval:60 * 60 * 24 * 45];
    [self.datePicker addTarget:self
                        action:@selector(changeValueInDatePicker:)
              forControlEvents:UIControlEventValueChanged];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// передаем параметры в RoutesController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showRoutes"]) {
        RoutesController *controller = (RoutesController *)segue.destinationViewController;
        controller.stationFrom = self.statonFrom.text;
        controller.stationTo = self.stationTo.text;
        controller.startDate = self.startDate;
    }
}

- (void)changeValueInDatePicker:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    self.startDate = [dateFormatter stringFromDate:self.datePicker.date];
}

@end
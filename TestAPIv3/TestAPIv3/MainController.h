//
//  ViewController.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *statonFrom;
@property (weak, nonatomic) IBOutlet UITextField *stationTo;

@property (weak, nonatomic) IBOutlet UIButton *buttonFind;

@property (nonatomic, strong) NSString *startDate;

@end
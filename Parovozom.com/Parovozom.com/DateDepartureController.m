//
//  DateDepartureController.m
//  Parovozom.com
//
//  Created by Dmitriy Demchenko on 02/15/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "DateDepartureController.h"
#import "UIColor+ConvertHEX.h"

@interface DateDepartureController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonChoiseDate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentChoiseDate;

- (IBAction)choiseDate:(id)sender;

@end

@implementation DateDepartureController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSStringFromClass([DateDepartureController class]);
    
    // BUTTON CHOISE DATE
    self.buttonChoiseDate.backgroundColor = [UIColor colorWithHexString:@"#F2854C"];
    self.buttonChoiseDate.layer.cornerRadius = 4.5f;
    [self.buttonChoiseDate setTitle:@"Выбрать дату" forState:UIControlStateNormal];
    [self.buttonChoiseDate.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    self.buttonChoiseDate.tintColor = [UIColor whiteColor];
    
    // SEGMENT CHOISE DATE
    self.segmentChoiseDate.tintColor = [UIColor colorWithHexString:@"#F2854C"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)choiseDate:(id)sender {
    NSLog(@"CHOISE DATE");
    self.dateDeparture = @"CHOISE DATE";
    [self.navigationController popViewControllerAnimated:YES];
}

@end
//
//  MainController.m
//  Parovozom.com
//
//  Created by Dmitriy Demchenko on 02/01/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "MainController.h"
#import "UIColor+ConvertHEX.h"
#import "UIImage+ImageWithColor.h"

// controllers
#import "FromStationController.h"
#import "ToStationController.h"
#import "DateDepartureController.h"

@interface MainController ()

@property (weak, nonatomic) IBOutlet UIView *doubleButtonView;

@property (weak, nonatomic) IBOutlet UIButton *buttonFromStation;
@property (weak, nonatomic) IBOutlet UIButton *buttonToStation;
@property (weak, nonatomic) IBOutlet UIButton *buttonChange;
@property (weak, nonatomic) IBOutlet UIButton *buttonDateDeparture;
@property (weak, nonatomic) IBOutlet UIButton *buttonFindTickets;

@end

@implementation MainController {
    
    NSString *fromStation;
    NSString *toStation;
    NSString *dateDeparture;
}

@synthesize dateDeparture;
@synthesize toStation;
@synthesize fromStation;

- (void)viewDidLoad {
    
    self.fromStation = @"Откуда";
    self.toStation = @"Куда";
    self.dateDeparture = @"Дата отправления";
    
    [super viewDidLoad];
    
    // MAIN VIEW
    self.view.backgroundColor = [UIColor colorWithHexString:@"#4BB179"];
    
    // LOGO
    UIImageView *logoView = [[UIImageView alloc]
                             initWithFrame:CGRectMake((self.view.bounds.size.width - 249) / 2,
                                                      (((self.view.bounds.size.height - 99) / 2) - 85) / 2,
                                                      249,
                                                      85)];
    logoView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoView];
    
    // DOUBLE BUTTON VIEW
    self.doubleButtonView.backgroundColor = [UIColor colorWithHexString:@"#5EB885"];
    self.doubleButtonView.layer.cornerRadius = 4.5f;
    self.doubleButtonView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.doubleButtonView.layer.borderWidth = 2.f;
    
    // BUTTON FROM STATION
    [self.buttonFromStation setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#4BB179"]]
                                      forState:UIControlStateHighlighted];
    [self.buttonFromStation setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.buttonFromStation setTitle:fromStation forState:UIControlStateNormal];
    
    // BUTTON TO STATION
    [self.buttonToStation setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#4BB179"]]
                                      forState:UIControlStateHighlighted];
    [self.buttonToStation setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.buttonToStation setTitle:toStation forState:UIControlStateNormal];
    
    // BUTTON CHANGE
    self.buttonChange.backgroundColor = [UIColor colorWithHexString:@"#48A26F"];
    self.buttonChange.layer.cornerRadius = 4.5f;
    self.buttonChange.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonChange.layer.borderWidth = 2.f;    
    
    // BUTTON DATE DEPARTURE
    self.buttonDateDeparture.backgroundColor = [UIColor colorWithHexString:@"#5EB885"];
    [self.buttonDateDeparture setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#4BB179"]]
                                    forState:UIControlStateHighlighted];
    self.buttonDateDeparture.layer.cornerRadius = 4.5f;
    self.buttonDateDeparture.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonDateDeparture.layer.borderWidth = 2.f;
    [self.buttonDateDeparture setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.buttonDateDeparture setTitle:self.dateDeparture forState:UIControlStateNormal];
    
    // BUTTON FIND TICKETS
    self.buttonFindTickets.backgroundColor = [UIColor whiteColor];
    self.buttonFindTickets.layer.cornerRadius = 4.5f;
    [self.buttonFindTickets setTitle:@"Найти билеты" forState:UIControlStateNormal];
    [self.buttonFindTickets.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    self.buttonFindTickets.tintColor = [UIColor colorWithHexString:@"#4BB179"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// прячем navigationController в MainController
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"showDateDeparture"]) {
        DateDepartureController *controller = (DateDepartureController *)segue.destinationViewController;
        controller.dateDeparture = nil;
    }
}

@end
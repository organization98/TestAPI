//
//  ViewController.m
//  Parovozom.com
//
//  Created by Dmitriy Demchenko on 02/01/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+ConvertHEX.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *doubleButtonView;

@property (weak, nonatomic) IBOutlet UIView *buttonDateDeparture;

@property (weak, nonatomic) IBOutlet UILabel *labelFromStation;
@property (weak, nonatomic) IBOutlet UILabel *labelToStation;

- (IBAction)buttonFromStation:(id)sender;
- (IBAction)buttonToStation:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // MAIN VIEW
    self.view.backgroundColor = [UIColor colorWithHexString:@"#4BB179"];
    
    // DOUBLE BUTTON VIEW
    self.doubleButtonView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"double-inputs"]];
    
    // BUTTONS: FROM, TO
    self.buttonFrom.highlighted = [UIColor colorWithHexString:@"#48A26F"];
    self.labelFromStation.text = @"Откуда";
    
    self.buttonTo.highlighted = [UIColor colorWithHexString:@"#48A26F"];
    self.labelToStation.text = @"Куда";
    
    // BUTTON DATE
    self.buttonDateDeparture.backgroundColor = [UIColor colorWithHexString:@"#5EB885"];
    self.buttonDateDeparture.layer.cornerRadius = 3.f;
    self.buttonDateDeparture.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonDateDeparture.layer.borderWidth = 2.f;
    
    // BUTTON FIND TICKETS
    self.buttonFindTickets.backgroundColor = [UIColor whiteColor];
    self.buttonFindTickets.layer.cornerRadius = 3.f;
    [self.buttonFindTickets setTitle:@"Найти билеты" forState:UIControlStateNormal];
    [self.buttonFindTickets.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    self.buttonFindTickets.tintColor = [UIColor colorWithHexString:@"#4BB179"];
    
    
    // BUTTON CHANGE
    self.buttonChange.backgroundColor = [UIColor colorWithHexString:@"#4BB179"];
    self.buttonChange.layer.cornerRadius = 3.f;
    self.buttonChange.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonChange.layer.borderWidth = 2.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonFromStation:(id)sender {
    NSLog(@"FROM");
}

- (IBAction)buttonToStation:(id)sender {
    NSLog(@"TO");
}
@end

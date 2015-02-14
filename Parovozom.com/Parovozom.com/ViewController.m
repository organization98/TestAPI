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
@property (weak, nonatomic) IBOutlet UIButton *buttonDateDeparture;
@property (weak, nonatomic) IBOutlet UIButton *buttonFindTickets;
@property (weak, nonatomic) IBOutlet UIButton *buttonChange;

@end

@implementation ViewController

- (void)viewDidLoad {
    
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
    
    // BUTTON DATE
    self.buttonDateDeparture.backgroundColor = [UIColor colorWithHexString:@"#5EB885"];
    self.buttonDateDeparture.layer.cornerRadius = 4.5f;
    self.buttonDateDeparture.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonDateDeparture.layer.borderWidth = 2.f;
    
    // BUTTON FIND TICKETS
    self.buttonFindTickets.backgroundColor = [UIColor whiteColor];
    self.buttonFindTickets.layer.cornerRadius = 4.5f;
    [self.buttonFindTickets setTitle:@"Найти билеты" forState:UIControlStateNormal];
    [self.buttonFindTickets.titleLabel setFont:[UIFont systemFontOfSize:16.f]];
    self.buttonFindTickets.tintColor = [UIColor colorWithHexString:@"#4BB179"];
    
    // BUTTON CHANGE
    self.buttonChange.backgroundColor = [UIColor colorWithHexString:@"#48A26F"];
    self.buttonChange.layer.cornerRadius = 4.5f;
    self.buttonChange.layer.borderColor = [UIColor whiteColor].CGColor;
    self.buttonChange.layer.borderWidth = 2.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
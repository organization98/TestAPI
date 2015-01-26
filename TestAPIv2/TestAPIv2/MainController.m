//
//  ViewController.m
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "MainController.h"
#import "RequestManager.h"

#import "Response.h"
#import "Route.h"

#import "MyStyleKit.h"

@interface MainController () {
    NSString *session;
    NSString *domain;
}

@end

@implementation MainController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"Main";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.31f green:0.69f blue:0.48f alpha:1.0f];
    
    // кастомизация кнопок
    for (UIButton *button in self.allButtonsStyle) {
        button.backgroundColor = [UIColor colorWithRed:0.33 green:0.72 blue:0.55 alpha:1];
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 5;
        button.clipsToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tintColor = [UIColor whiteColor];
    }
    
    // кастомизация textView
    self.textView.text = nil;
    self.textView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    self.textView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.cornerRadius = 5;
    self.textView.clipsToBounds = YES;
    self.textView.font = [UIFont systemFontOfSize:14.f];
    self.textView.editable = NO;
    
    // кастомизация label
    self.label.text = nil;
    self.label.font = [UIFont systemFontOfSize:15.f];
    self.label.textColor = [UIColor whiteColor];
    
    domain = @"http://booking.ibp.org.ua/api";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Actions

- (IBAction)authorization:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://booking.ibp.org.ua/api/auth?username=demo&password=demo"];
    
    [[RequestManager sharedManager] authorizationFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
        Response *response = [Response responseFromDictionary:data];
        if ([response.result  isEqual: @"OK"]) {
            session = response.session;
        }
    }];
}

- (IBAction)getTrains:(id)sender {
    
    NSString *from = @"2210700";
    NSString *to = @"2200001";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *tomorrow = [[NSDate date] dateByAddingTimeInterval:60 * 60 * 24 * 1];
    NSString *startDate = [dateFormatter stringFromDate:tomorrow];
    
    NSString *transaction = @"trains";
    
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?from=%@&to=%@&startDate=%@&session=%@", domain, transaction, from, to, startDate, session]];
    [[RequestManager sharedManager] authorizationFromURL:requestURL completion:^(BOOL succes, id data, NSError *error) {
        if (succes == NO) {
//            [MyStyleKit alertWithMessage:[NSString stringWithFormat:@"%@\n%li\n%@", error.domain, error.code, [error.userInfo objectForKey:@"message"]]];
            NSLog(@"%@", [[error userInfo] objectForKey:@"message"]);
            //[MyStyleKit alertWithMessage:[NSString stringWithFormat:@"%@", [[error userInfo] objectForKey:@"message"]]];
            
        } else {
            self.label.text = [[[data objectForKey:@"items"] firstObject] objectForKey:@"class"];
            self.textView.text = [NSString stringWithFormat:@"%@", data];
            /*
            Route *route = [Route routeFromDictionary:data];
             
            RouteController *controller = [[RouteController alloc] init];
            controller.route = route;
            */
        }
    }];
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showRouteSegue"]){
        RouteController *controller = (RouteController *)segue.destinationViewController;
        controller.route = 0;
    }
}
*/
- (IBAction)getPrices:(id)sender {
    
    NSString *transaction = @"prices";
    
    NSString *requestURL = [NSString stringWithFormat:@"%@/%@?train=%@&session=%@", domain, transaction, @"079П", session];
    NSURL *url = [NSURL URLWithString:[requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[RequestManager sharedManager] authorizationFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
    }];
}

- (IBAction)getPlaces:(id)sender {
    
    NSString *transaction = @"places";
    NSString *train = @"079П";
    NSString *wagon_number = @"15";
    NSString *wagon_type = @"П";
    NSString *places = @"09";
    
    NSString *requestURL = [NSString stringWithFormat:@"%@/%@?train=%@&wagon_number=%@&wagon_type=%@&places=%@&session=%@", domain, transaction, train, wagon_number, wagon_type, places, session];
    NSURL *url = [NSURL URLWithString:[requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[RequestManager sharedManager] authorizationFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
    }];
}

- (IBAction)reserve:(id)sender {
    
    NSString *transaction = @"reserve";
    
    NSString *reserveURL = [NSString stringWithFormat:@"%@/%@?session=%@", domain, transaction, session];
    [[RequestManager sharedManager] reserveFromURL:reserveURL completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
    }];
}

@end
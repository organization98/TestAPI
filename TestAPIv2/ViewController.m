//
//  ViewController.m
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "ViewController.h"
#import "RequestManager.h"
#import "Response.h"

@interface ViewController () {
    NSString *session;
    NSString *domain;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = nil;
    self.textView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.textView.font = [UIFont systemFontOfSize:14.f];
    self.textView.editable = NO;
    self.label.text = nil;
    domain = @"http://booking.ibp.org.ua/api";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)authorization:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://booking.ibp.org.ua/api/auth?username=demo&password=demo"];
    [[RequestManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
        Response* user = [Response userFromDictionary:data];
        if ([user.result  isEqual: @"OK"]) {
            session = user.session;
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
    
    NSString *requestURL = [NSString stringWithFormat:@"%@/%@?from=%@&to=%@&startDate=%@&session=%@", domain, transaction, from, to, startDate, session];
    NSURL *url = [NSURL URLWithString:requestURL];
    [[RequestManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        self.label.text = [[[data objectForKey:@"items"] firstObject] objectForKey:@"class"];
        self.textView.text = [NSString stringWithFormat:@"%@", data];
    }];
}

- (IBAction)getPrices:(id)sender {
    NSString *transaction = @"prices";
    NSString *requestURL = [NSString stringWithFormat:@"%@/%@?train=%@&session=%@", domain, transaction, @"079П", session];
    NSString *encodedURL = [requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodedURL];
    [[RequestManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
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
    NSString *encodedURL = [requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodedURL];
    [[RequestManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
    }];
}

- (IBAction)reserve:(id)sender {
    NSString *transaction = @"reserve";
    NSString *reserveURL = [NSString stringWithFormat:@"%@/%@?session=%@", domain, transaction, session];
    [[RequestManager sharedManager] reserve:reserveURL completion:^(BOOL succes, id data, NSError *error) {
        self.textView.text = [NSString stringWithFormat:@"%@", data];
    }];
}

@end
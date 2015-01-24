//
//  ViewController.m
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "User.h"

@interface ViewController () {
    NSString *session;
    NSString *domain;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    domain = @"http://booking.ibp.org.ua/api";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)authorization:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://booking.ibp.org.ua/api/auth?username=demo&password=demo"];
    [[NetworkManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        NSLog(@"%@", data);
        User* user = [User userFromDictionary:data];
        if ([user.result  isEqual: @"OK"]) {
            session = user.session;
        }
    }];
}

- (IBAction)getTrains:(id)sender {
    NSString *from = @"2210700";
    NSString *to = @"2200001";
    NSString *startDate = @"2015-01-26";
    NSString *transaction = @"trains";
    
    NSString *requestURL = [NSString stringWithFormat:@"%@/%@?from=%@&to=%@&startDate=%@&session=%@", domain, transaction, from, to, startDate, session];
    NSURL *url = [NSURL URLWithString:requestURL];
    [[NetworkManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        NSLog(@"%@", data);
    }];
}

- (IBAction)getPrices:(id)sender {
    NSString *transaction = @"prices";
    NSString *requestURL = [NSString stringWithFormat:@"%@/%@?train=%@&session=%@", domain, transaction, @"733П", session];
    NSString *encodedURL = [requestURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"requestURL: %@", requestURL);
    NSURL *url = [NSURL URLWithString:encodedURL];
    [[NetworkManager sharedManager] loadDataFromURL:url completion:^(BOOL succes, id data, NSError *error) {
        NSLog(@"%@", data);
    }];
}

@end
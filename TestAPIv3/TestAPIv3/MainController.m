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

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showRoutes"]) {
        RoutesController *controller = (RoutesController *)segue.destinationViewController;
        controller.stationFrom = self.statonFrom.text;
        controller.stationTo = self.stationTo.text;
    }
}

@end
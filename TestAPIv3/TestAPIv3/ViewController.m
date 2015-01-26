//
//  ViewController.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/26/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "ViewController.h"
#import "RoutesController.h"
#import "SessionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SessionManager sharedManager] open];
    [[SessionManager sharedManager] getRoutes:self.statonFrom.text to:self.stationTo.text];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showRoutes"]){
        RoutesController *c = (RoutesController *)segue.destinationViewController;
        c.stationFrom = self.statonFrom.text;
        c.stationTo = self.stationTo.text;
    }
    
}
@end

//
//  SecondController.m
//  APIWebViewTest
//
//  Created by Dmitriy Demchenko on 02/03/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "MainController.h"
#import "WebViewController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)openURL:(id)sender {
    
//    WebViewController *admin = [[WebViewController alloc]initWithNibName:@"WebShow" bundle:nil];
//    [self.navigationController pushViewController:admin animated:YES];
    
    WebViewController *controller = [[WebViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

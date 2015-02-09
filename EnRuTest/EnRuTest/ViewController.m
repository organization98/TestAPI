//
//  ViewController.m
//  EnRuTest
//
//  Created by Dmitriy Demchenko on 02/08/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = [NSString stringWithFormat:NSLocalizedString(@"MSG", nil)];
    
    self.label.text = [NSString stringWithFormat:NSLocalizedString(@"STR", @"String: %@"), str];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

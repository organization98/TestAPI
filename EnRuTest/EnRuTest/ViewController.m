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
    
    self.imageView.image = [UIImage imageNamed:@"arrow-orange.jpg"];
    
    // Test UIImageView
    self.im2 = [UIImage imageNamed:@"arrow-orange.jpg"];
    self.imV = [[UIImageView alloc] initWithImage:self.im2];
    [self.view addSubview:self.imV];
    NSLog(@"H:%.2f, W:%.2f", self.im2.size.height, self.im2.size.width);
    //
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:@"2015-12-01 12:12:12"];
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setLocale:[NSLocale currentLocale]];
    [dateFormatter2 setDateFormat:@"E, d MMM, HH:mm"];
    
    NSString *str = [dateFormatter2 stringFromDate:dateFromString];
    
    self.label.text = [NSString stringWithFormat:NSLocalizedString(@"STR", @"String: %@"), str];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  SchemeController.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/30/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "SchemeController.h"
#import "WebViewController.h"
#import "SchemeType40.h"

@interface SchemeController ()

@end

@implementation SchemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSStringFromClass([SchemeController class]);
    
    self.scrollView.contentSize = CGSizeMake(1043, 211);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // внешний вид кнопок "корзины", "купить"
    for (UIButton *buttons in self.buttonStyle) {
        buttons.backgroundColor = [UIColor colorWithRed:0.9 green:0.42 blue:0.23 alpha:1];
        buttons.tintColor = [UIColor whiteColor];
        buttons.layer.cornerRadius = 5;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// передаем параметры в WebViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showWebView"]) {
        WebViewController *controller = (WebViewController *)segue.destinationViewController;
        controller.url = [NSURL URLWithString:@"http://booking.ibp.org.ua/payment/pay?price=14560&description=Hello!/"];
    }
}

@end
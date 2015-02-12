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
#import "UIColor+ConvertHEX.h"

@interface SchemeController ()

@end

@implementation SchemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSStringFromClass([SchemeController class]);
    
//    self.scrollView.contentSize = CGSizeMake(1043, 211);
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // внешний вид кнопок "корзины", "купить"
    for (UIButton *buttons in self.buttonStyle) {
        buttons.backgroundColor = [UIColor colorWithHexString:@"#F2854C"];
        buttons.tintColor = [UIColor colorWithHexString:@"#FFFFFF"];
        buttons.layer.cornerRadius = 5;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    self.scrollView.contentSize = CGSizeMake(1043, 211);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    NSLog(@"W: %f, H: %f", self.scrollView.contentSize.width, self.scrollView.contentSize.height);
}

// передаем параметры в WebViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showWebView"]) {
        WebViewController *controller = (WebViewController *)segue.destinationViewController;
        
        // Test URLs
        NSString *testStr = @"http://api.ibp.org.ua/";
        NSString *httpsStr = @"http://booking.ibp.org.ua/payment/pay?price=14560&description=Hello!/";
        NSString *platezhka = @"https://test.plategka.com/services/gateway/";
        
        controller.url = [NSURL URLWithString:httpsStr];
    }
}

@end
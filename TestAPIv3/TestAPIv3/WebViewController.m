//
//  WebViewController.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 02/04/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "WebViewController.h"
#import "NSURLRequest+IgnoreSSL.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = NO;
    self.navigationItem.title = NSStringFromClass([WebViewController class]);
    
    [self loadURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadURL {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
    [NSURLRequest allowsAnyHTTPSCertificateForHost:[self.url host]];
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

// просто УРЛ с переадресацией
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"%@", [request URL].absoluteString);
    
    if ([[request URL].absoluteString containsString:@"index2.html"] == YES) {
        [self.navigationController popViewControllerAnimated:YES];
        return YES;
        
    } else if ([[request URL].absoluteString containsString:@"bad.html"] == YES) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Error payment" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES;
}

@end

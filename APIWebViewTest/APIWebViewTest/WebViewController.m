//
//  ViewController.m
//  APIWebViewTest
//
//  Created by Dmitriy Demchenko on 02/03/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController {
    NSString *urlString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webWiew.delegate = self;
    [self loadURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadURL {
    urlString = @"http://api.ibp.org.ua/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webWiew loadRequest:request];
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    NSLog(@"Started");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    NSLog(@"Finished");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    NSLog(@"Error %@", [error localizedDescription]);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([[request URL].absoluteString containsString:@"index2.html"] == YES) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        NSLog(@"HOME URL %@", [request URL].absoluteString);
        return YES;
        
    } else if ([[request URL].absoluteString containsString:@"bad.html"] == YES) {
        NSLog(@"BAD URL %@", [request URL].absoluteString);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Error payment" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES;
}

@end

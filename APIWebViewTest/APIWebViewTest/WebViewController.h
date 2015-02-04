//
//  ViewController.h
//  APIWebViewTest
//
//  Created by Dmitriy Demchenko on 02/03/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webWiew;

@end


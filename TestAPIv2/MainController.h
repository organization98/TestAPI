//
//  ViewController.h
//  TestAPIv2
//
//  Created by Dmitriy Demchenko on 01/24/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UIViewController

- (IBAction)authorization:(id)sender;
- (IBAction)getTrains:(id)sender;
- (IBAction)getPrices:(id)sender;
- (IBAction)getPlaces:(id)sender;
- (IBAction)reserve:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtonsStyle;


@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
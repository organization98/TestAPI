//
//  SchemeController.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/30/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchemeController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *schemeView;

@property (strong, nonatomic) NSString *wagonType;
@property (strong, nonatomic) NSDictionary *placesDict;

@end
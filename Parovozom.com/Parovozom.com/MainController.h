//
//  MainController.h
//  Parovozom.com
//
//  Created by Dmitriy Demchenko on 02/01/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UIViewController

@property (strong, nonatomic) NSString *fromStation;
@property (strong, nonatomic) NSString *toStation;
@property (strong, nonatomic) NSString *dateDeparture;

@end
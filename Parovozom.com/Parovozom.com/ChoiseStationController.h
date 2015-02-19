//
//  ChoiseStationController.h
//  Parovozom.com
//
//  Created by Dmitriy Demchenko on 02/15/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainController.h"

typedef void (^SetButtonTitle)(NSString *name, NSString *code);

@protocol ChoiseStationControllerDelegate <NSObject>

@required

- (void)setStationName:(NSString *)name andCode:(NSString *)code;

@end


@interface ChoiseStationController : UIViewController

@property (nonatomic, strong) id <ChoiseStationControllerDelegate> delegate;

@property (copy, nonatomic) SetButtonTitle myBlock;

@end
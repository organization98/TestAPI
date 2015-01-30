//
//  SchemeType40.h
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/30/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchemeType40 : UIView

- (IBAction)actionButtons:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewScheme;
@property (weak, nonatomic) IBOutlet UIImageView *imageScheme;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnSets;

@end
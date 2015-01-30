//
//  SchemeType40.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/30/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "SchemeType40.h"
#import "CustomButton.h"

@implementation SchemeType40

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Load the interface file from .xib
        [[NSBundle mainBundle] loadNibNamed:@"SchemeType40" owner:self options:nil];
        
        // Add as a subview
        [self addSubview:self.viewScheme];
        
        CustomButton *btn = [CustomButton buttonWithNumber:@"01"];
        [btn setFrame:CGRectMake(0, 0, 30, 30)];
        [self.viewScheme addSubview:btn];
        
        
        
    }
    return self;
}

- (IBAction)actionButtons:(id)sender {
    NSLog(@"actionButtons: Click");
}

@end

//
//  CustomButton.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/30/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "CustomButton.h"
#import "SchemeType40.h"

@implementation CustomButton {
    BOOL isSelected;
}

+ (CustomButton *)buttonWithNumber:(NSString *)number {
    CustomButton *btn = [[CustomButton alloc] init];
    [btn setTitle:number
         forState:UIControlStateNormal];
    [btn setTitle:number
         forState:UIControlStateSelected];
    [btn setTitle:number
         forState:UIControlStateDisabled];
    return btn;
}

- (id)init{
    self = [super init];
    if (self) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateDisabled];
        
        [self setEnabled:NO];
        // selected
        isSelected = NO;
        
        [self setBackgroundColor:[UIColor grayColor]];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
//        self.titleLabel.textColor = [UIColor yellowColor];
        [self setBackgroundImage:[UIImage imageNamed:@"forward-seat-orange"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(selectedPlaces) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)selectedPlaces {
    if (isSelected == NO) {
        isSelected = YES;
        [self setSelected:YES];
    } else {
        isSelected = NO;
        [self setSelected:NO];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectedPlace" object:self userInfo:@{@"number":@"4"}];
}

@end

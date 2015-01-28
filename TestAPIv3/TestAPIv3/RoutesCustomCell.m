//
//  RoutesCustomCell.m
//  TestAPIv3
//
//  Created by Dmitriy Demchenko on 01/28/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "RoutesCustomCell.h"

@implementation RoutesCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
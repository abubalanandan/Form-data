//
//  CustomButton.m
//  EspressoLane
//
//  Created by Abu on 11/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib {
    
    self.backgroundColor = BUTTON_BG_COLOR;
    [[self layer] setCornerRadius:5.0f];
    [[self layer] setMasksToBounds:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

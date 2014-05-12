//
//  ELTwelfthViewController.h
//  EspressoLane
//
//  Created by Abu on 11/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"
@interface ELTwelfthViewController : UIViewController<UITextViewDelegate>
@property (nonatomic,weak)IBOutlet UITextView *marginalView;
@property (nonatomic,weak)IBOutlet CustomButton *submitButton;
-(IBAction)submitButtonPressed:(id)sender;
-(IBAction)resetButtonPressed:(id)sender;
@end

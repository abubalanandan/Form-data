//
//  ELFirstViewController.h
//  EspressoLane
//
//  Created by Abu on 09/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELFirstViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic,weak) IBOutlet UITextField *fcField;
@property (nonatomic,weak) IBOutlet UITextField *dateField;
@property (nonatomic,weak) IBOutlet UITextField *startTimeField;
@property (nonatomic,weak) IBOutlet UITextField *locationField;
@property (nonatomic,weak) IBOutlet UITextField *franchiseeField;
@property (nonatomic,weak) IBOutlet UITextField *cupCountOneField;
@property (nonatomic,weak) IBOutlet UITextField *cupCountTwoField;
-(IBAction)submitButtonPressed:(id)sender;
@end

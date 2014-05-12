//
//  ELSecondViewController.h
//  EspressoLane
//
//  Created by Abu on 09/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELSecondViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UIView *machineOneView;
@property (nonatomic, weak) IBOutlet UIView *machineTwoView;
@property (nonatomic, weak) IBOutlet UIView *tasteView;
@property (nonatomic, weak) IBOutlet UIView *machineOneSpeedView;
@property (nonatomic, weak) IBOutlet UIView *machineTwoSpeedView;
@property (nonatomic, weak) IBOutlet UIView *milkFrothView;
@property (nonatomic, weak) IBOutlet UIView *milkFrothTempOneView;
@property (nonatomic, weak) IBOutlet UIView *milkFrothTempTwoView;
@property (nonatomic, weak) IBOutlet UIView *pouringMethodView;
@property (nonatomic, weak) IBOutlet UIView *overallMakingView;
@property (nonatomic, weak) IBOutlet UITextField *machineOne8ozField;
@property (nonatomic, weak) IBOutlet UITextField *machineOne12ozField;
@property (nonatomic, weak) IBOutlet UITextField *machineOne16ozField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwo8ozField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwo12ozField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwo16ozField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *tasteCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeed8ozSecondsField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeed8ozMLField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeed12ozSecondsField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeed12ozMLField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeed16ozSecondsField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeed16ozMLField;
@property (nonatomic, weak) IBOutlet UITextField *machineOneSpeedCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeed8ozSecondsField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeed8ozMLField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeed12ozSecondsField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeed12ozMLField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeed16ozSecondsField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeed16ozMLField;
@property (nonatomic, weak) IBOutlet UITextField *machineTwoSpeedCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *milkFrothCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *milkFrothTempOneField;
@property (nonatomic, weak) IBOutlet UITextField *milkFrothTempOneCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *milkFrothTempTwoField;
@property (nonatomic, weak) IBOutlet UITextField *milkFrothTempTwoCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *pouringMethodCommentsField;
@property (nonatomic, weak) IBOutlet UITextField *overallMakingCommentsField;


@end

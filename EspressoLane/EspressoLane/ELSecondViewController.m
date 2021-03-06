//
//  ELSecondViewController.m
//  EspressoLane
//
//  Created by Abu on 09/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import "ELSecondViewController.h"

#define kOFFSET_FOR_KEYBOARD 280

@interface ELSecondViewController ()
@property BOOL keyboardShown;
@property BOOL movedUp;
@end

@implementation ELSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    for (UIView *view in [self.view subviews]) {
        for (UIView *subview in [view subviews]){
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)subview;
            textField.delegate = self;
        }
    }
    }
    _keyboardShown = NO;
    _movedUp = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
/*    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
   */ [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];/**/
    //[[NSNotificationCenter defaultCenter]postNotificationName:@"SUBMIT_PRESSED" object:nil];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

#pragma mark
#pragma mark -- Keyboard handling


-(void)keyboardWillShow:(NSNotification *)notification {
    // Animate the current view out of the way
    _keyboardShown = YES;
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }

    if (_movedUp && _keyboardShown) {
        [self setViewMovedUp:NO];
    }
    _keyboardShown = NO;
    _movedUp = NO;
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
    _movedUp = YES;
}

#pragma mark -- TextField Delegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ((textField.frame.origin.y + [textField superview].frame.origin.y)>=(self.machineTwoSpeedView.frame.origin.y + self.machineTwoSpeedCommentsField.frame.origin.y)) {
        if (_keyboardShown) {
            return YES;
        }
        [self keyboardWillShow:nil];
    }
    
    return YES;
}

//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    if ((textField.frame.origin.y + [textField superview].frame.origin.y)>(self.machineTwoSpeedView.frame.origin.y + self.machineTwoSpeedCommentsField.frame.origin.y)) {
//        if (_keyboardShown) {
//            [self keyboardWillHide];
//            
//        }
//    }
//    
//    [textField resignFirstResponder];
//}

//
//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    if (_movedUp) {
//        if (_keyboardShown) {
//            [self keyboardWillHide];
//            
//        }
//    }
//    
//    [textField resignFirstResponder];
//    return YES;
//
//}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    if (_movedUp) {
//        if (_keyboardShown) {
//            [self keyboardWillHide];
//
//        }
//    }

    [textField resignFirstResponder];
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

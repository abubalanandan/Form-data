//
//  ELFirstViewController.m
//  EspressoLane
//
//  Created by Abu on 09/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import "ELFirstViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kOFFSET_FOR_KEYBOARD 250
@interface ELFirstViewController ()

@end

@implementation ELFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
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
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
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
}


#pragma mark
#pragma mark -- UITextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    //Handle keyboard offset
    return YES;
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{

    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==_fcField) {
        [_dateField becomeFirstResponder];
    }else if (textField == _dateField){
        [_startTimeField becomeFirstResponder];
    }else if (textField == _startTimeField){
        [_locationField becomeFirstResponder];
    }else if (textField == _locationField){
        [_franchiseeField becomeFirstResponder];
    }else if (textField == _franchiseeField){
        [_cupCountOneField becomeFirstResponder];
    }else if(textField == _cupCountOneField){
        [_cupCountTwoField becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    
    
    return YES;
}


#pragma mark
#pragma mark -- IBActions

-(IBAction)submitButtonPressed:(id)sender{
    

    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
    
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, self.view.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    NSString *fileName = @"espresso3.pdf";
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    [self.view.layer renderInContext:pdfContext];
    
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:fileName];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
}


- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeLeft;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

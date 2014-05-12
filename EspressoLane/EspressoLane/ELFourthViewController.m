//
//  ELFourthViewController.m
//  EspressoLane
//
//  Created by Abu on 11/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import "ELFourthViewController.h"
#define kOFFSET_FOR_KEYBOARD 100

@interface ELFourthViewController ()
@property BOOL movedUp;
@property (nonatomic,strong) UIButton *selectedCameraButton;
@end

@implementation ELFourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (UIView *subview in [self.view subviews]){
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)subview;
            textField.delegate = self;
        }
    }
    _movedUp = NO;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton *button = (UIButton *)view;
            [button addTarget:self action:@selector(cameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    //[[NSNotificationCenter defaultCenter]postNotificationName:@"SUBMIT_PRESSED" object:nil];
}


-(IBAction)cameraButtonPressed:(id)sender{
    self.selectedCameraButton = (UIButton *)sender;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    picker.sourceType =  UIImagePickerControllerSourceTypeCamera ;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    [self.selectedCameraButton setBackgroundImage:image forState:UIControlStateNormal];
    [self.selectedCameraButton setBackgroundImage:image forState:UIControlStateSelected];
    [self dismissModalViewControllerAnimated:YES];
    
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
    _movedUp = YES;
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
    if (_movedUp) {
        [self setViewMovedUp:NO];
    }
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
}



-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.frame.origin.y >= self.marginalField.frame.origin.y) {
        if (_movedUp) {
            return YES;
        }
        [self keyboardWillShow:nil];
    }
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

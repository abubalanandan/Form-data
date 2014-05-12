//
//  ELTenthViewController.m
//  EspressoLane
//
//  Created by Abu on 11/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import "ELTenthViewController.h"

@interface ELTenthViewController ()
@property (nonatomic,strong) UIButton *selectedCameraButton;
@end

@implementation ELTenthViewController

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
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;

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

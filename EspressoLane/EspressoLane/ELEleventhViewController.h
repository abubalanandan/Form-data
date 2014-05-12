//
//  ELEleventhViewController.h
//  EspressoLane
//
//  Created by Abu on 11/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELEleventhViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,weak)IBOutlet UITextField *marginalField;
@property (nonatomic,strong) UIButton *selectedCameraButton;
@end

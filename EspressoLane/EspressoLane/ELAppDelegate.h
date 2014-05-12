//
//  ELAppDelegate.h
//  EspressoLane
//
//  Created by Abu on 09/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELFirstViewController.h"
#import "ELThirdViewController.h"
#import "ELTwelfthViewController.h"

#import <MessageUI/MFMailComposeViewController.h>



@interface ELAppDelegate : UIResponder <UIApplicationDelegate,MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ELFirstViewController *firstViewController;
@property (strong,nonatomic) ELThirdViewController *thirdViewController;
@property (strong,nonatomic) ELTwelfthViewController *twelfthViewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@end



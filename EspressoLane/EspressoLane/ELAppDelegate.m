//
//  ELAppDelegate.m
//  EspressoLane
//
//  Created by Abu on 09/05/14.
//  Copyright (c) 2014 abu. All rights reserved.
//

#import "ELAppDelegate.h"
#import "ELSecondViewController.h"
#import "ELFirstViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@implementation ELAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.tabBarController =
    (UITabBarController *)self.window.rootViewController;
    self.firstViewController = [[self.tabBarController viewControllers]objectAtIndex:0];
    self.twelfthViewController = [[self.tabBarController viewControllers]lastObject];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(submit) name:@"SUBMIT_PRESSED" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reset) name:@"RESET_PRESSED" object:nil];
    return YES;
}


-(void)reset{
    for (UIViewController *viewController in [self.tabBarController viewControllers]) {
        if ([viewController isKindOfClass:[ELSecondViewController class]]) {
            
            for (UIView *view in [viewController.view subviews]) {
                for (UIView *subview in [view subviews]) {
                    if ([subview isKindOfClass:[UITextField class]]) {
                        UITextField *textField = (UITextField *)subview;
                        textField.text = @"";
                    }
                }
            }
        }else{
            for (UIView *view in [viewController.view subviews]) {
                if ([view isKindOfClass:[UITextField class]]) {
                    UITextField *textField = (UITextField *)view;
                    textField.text = @"";
                }
                
            }
            
        }
    }
}
- (void)submit{
    
    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
    CGRect bounds = CGRectMake(0, 0, 1024, 768);
    UIGraphicsBeginPDFContextToData(pdfData, bounds, nil);
    
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    //UIGraphicsBeginPDFContextToData(pdfData, self.firstViewController.view.bounds, nil);
    for (UIViewController *viewController in [self.tabBarController viewControllers]) {
        
        
        [viewController.view setBounds:bounds];
        UIGraphicsBeginPDFPage();
        CGContextRef pdfContext = UIGraphicsGetCurrentContext();
        [viewController.view.layer renderInContext:pdfContext];
    }
    
    NSString *fileName = @"espresso.pdf";
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:fileName];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    
    NSData *data = [[NSData alloc]initWithContentsOfFile:documentDirectoryFilename];
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    if ([MFMailComposeViewController canSendMail]) {
        
        
        controller.mailComposeDelegate = self;
        [controller setSubject:@"Details"];
        [controller addAttachmentData:data mimeType:@"application/pdf" fileName:@"espresso.pdf"];
        [controller setMessageBody:@"Hi" isHTML:NO];
        [controller setToRecipients:[NSArray arrayWithObjects:@"abu.316@gmail.com", nil]];
        [self.twelfthViewController presentViewController:controller animated:YES completion:nil];
        NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
        
        
    }else{
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:@"Please configure mail account before you can send one." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    self.twelfthViewController.submitButton.hidden = NO;

    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    [self.twelfthViewController dismissViewControllerAnimated:YES completion:nil];
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

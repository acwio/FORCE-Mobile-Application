//
//  LoginViewController.m
//  FORCE
//
//  Created by Alex on 11/3/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

//  Synthesize accessors
@synthesize managedObjectContext, usernameField, passwordField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"login.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    [usernameField addTarget:self
                      action:@selector(resignAndLogin:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [passwordField addTarget:self
                      action:@selector(resignAndLogin:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
}

//  When we are done editing on the keyboard
- (IBAction)resignAndLogin:(id)sender
{
    //  Get a reference to the text field on which the done button was pressed
    UITextField *tf = (UITextField *)sender;
    
    //  Check the tag. If this is the username field, then jump to the password field automatically
    if (tf.tag == 1) {
        
        [passwordField becomeFirstResponder];
        
        //  Otherwise we pressed done on the password field, and want to attempt login
    } else {
        
        //  First put away the keyboard
        [sender resignFirstResponder];
        
        if([tf.text isEqualToString:@"password"]){
            //  We found a matching login user!  Force the segue transition to the next view
            [self performSegueWithIdentifier:@"LoginSegue" sender:sender];}
        else {
            // Error Notification
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Incorrect"
                                                            message:@"Wrong Username or Password"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

//  When the view reappears after logout we want to wipe the username and password fields
- (void)viewWillAppear:(BOOL)animated
{
   [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [usernameField setText:@""];
    [passwordField setText:@""];
}

@end

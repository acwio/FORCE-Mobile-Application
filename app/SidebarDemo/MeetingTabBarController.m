//
//  MeetingTabBarController.m
//  FORCE
//
//  Created by Nathan Reale on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "MeetingTabBarController.h"
#import "SWRevealViewController.h"
#import "Meeting.h"
#import "DataClass.h"

@interface MeetingTabBarController ()

@end

@implementation MeetingTabBarController

@synthesize meeting;

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
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:132.0/255.0 green:196.0/255.0 blue:64.0/255.0 alpha:1.0]];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [[self.tabBar.items objectAtIndex:2] setBadgeValue:[NSString stringWithFormat:@"%d", [self.meeting.people count]]];
    [[self.tabBar.items objectAtIndex:3] setBadgeValue:[NSString stringWithFormat:@"%d", [self.meeting.files count]]];
    
    [self becomeFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}


- (void) viewDidDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewDidDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        MeetingTabBarController *stubController = [self.storyboard instantiateViewControllerWithIdentifier:@"MeetingTabBar"];
        [stubController setSelectedIndex:4];
        stubController.view.backgroundColor = [UIColor whiteColor];
        
        Meeting *meet = [[DataClass getInstance] next];
        stubController.title = meet.name;
        stubController.meeting = meet;
        
        // Push the new meeting page on top of the current page
        [(UINavigationController*)self.revealViewController.frontViewController pushViewController:stubController animated:YES];
    }
    [super motionEnded:motion withEvent:event];
}

@end

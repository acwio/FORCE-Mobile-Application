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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

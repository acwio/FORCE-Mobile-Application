//
//  MeetingTabBarController.m
//  FORCE
//
//  Created by Nathan Reale on 10/31/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "MeetingTabBarController.h"
#import "SWRevealViewController.h"

@interface MeetingTabBarController ()

@end

@implementation MeetingTabBarController

@synthesize data;
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
    
    self.meeting = [[Meeting alloc] init];
    self.meeting.name = @"Monthly Financial Report";
    self.meeting.date = @"Today, October 28";
    self.meeting.startTime = @"4:00 PM";
    self.meeting.endTime = @"2:00pm";
    self.meeting.description = @"This meeting will cover all spending and inquiries into the company's finances and economic growth over the last month.";
    self.meeting.company = @"Smith & Lee";
    self.meeting.address = @"123 Main Street, Cityville, TN 12345";
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

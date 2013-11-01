//
//  MeetingViewController.m
//  FORCE
//
//  Created by Alex on 10/27/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "MeetingViewController.h"
#import "SWRevealViewController.h"

@interface MeetingViewController ()

@end

@implementation MeetingViewController

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
    
    /* the following line will allow the nav bar & blue menu button to show */
    //[[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    self.title = @"Archive";
    //self.view.backgroundColor = [UIColor clearColor];
    //self.view.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.477 blue: 1.0 alpha:1.0];
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    //_sidebarButton.target = self.revealViewController;
    //_sidebarButton.action = @selector(revealToggle:);
        
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10.0, 2.0, 28.0, 20.0)];
    [btn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=barBtn;


}

// This is called both on load and after returning to this view
// The gestures need to be set both times, so that was moved here.
- (void)viewDidAppear:(BOOL)animated
{
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  SidebarDemo
//
//  Created by Simon on 28/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.title = @"Dashboard";
    //self.view.backgroundColor = [UIColor clearColor];
    //self.view.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.477 blue: 1.0 alpha:1.0];
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    /* make nav bar button */
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10.0, 2.0, 28.0, 20.0)];
    [btn setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=barBtn;
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

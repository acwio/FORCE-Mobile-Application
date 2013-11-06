//
//  SettingsViewController.m
//  FORCE
//
//  Created by nep2d on 11/6/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    
    UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(10.0, 2.0, 25.5, 24.0)];
    [btn setBackgroundImage:[UIImage imageNamed:@"Nav_Icon.png"] forState:UIControlStateNormal];
    [btn addTarget:self.revealViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=barBtn;
    /* navigation bar button */
    
    /* search bar button */
    UIButton *btn2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(10.0, 2.0, 25.5, 24.0)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"Search_Magnify_Icon.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self.navigationController.searchDisplayController action:@selector(rightRevealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtn2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    self.navigationItem.rightBarButtonItem=barBtn2;
	// Do any additional setup after loading the view.
}

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

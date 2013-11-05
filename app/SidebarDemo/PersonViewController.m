//
//  PersonViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/4/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

@synthesize person;
@synthesize imageView;

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

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [imageView setImage:[UIImage imageNamed:person.picURL]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  DetailViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "DetailViewController.h"
#import "MeetingTabBarController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize meeting;

@synthesize titleLabel;
@synthesize dateLabel;
@synthesize timeLabel;
@synthesize companyLabel;
@synthesize addressLabel;
@synthesize descriptionLabel;

@synthesize peopleView;

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
    
    self.meeting = ((MeetingTabBarController *)self.tabBarController).meeting;
    
    self.titleLabel.text = meeting.name;
    self.dateLabel.text = meeting.date;
    self.timeLabel.text = meeting.startTime;
    self.companyLabel.text = meeting.company;
    self.addressLabel.text = meeting.address;
    self.descriptionLabel.text = meeting.description;
    
    
    // Draw the images of the people
    for (Person *p in meeting.people) {
        NSLog(@"%@", p.name);
        UIImage *image = [[UIImage alloc] init];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [imageView setImage:image];
        [self.peopleView addSubview:imageView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

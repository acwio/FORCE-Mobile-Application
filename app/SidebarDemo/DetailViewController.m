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
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
    [formatter setDateFormat:@"EEE MMM dd yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:meeting.date];
    [formatter setDateFormat:@"HH:mm a"];
    NSString *time = [formatter stringFromDate:meeting.date];
    self.dateLabel.text = stringFromDate;
    self.timeLabel.text = time;
    self.companyLabel.text = meeting.company;
    self.addressLabel.text = meeting.address;
    self.descriptionLabel.text = meeting.description;
    
    
    // Draw the images of the people
    int count = 0;
    for (Person *p in meeting.people) {
        UIImage *image = [UIImage imageNamed:p.picURL];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        imageView.frame = CGRectMake(count*40, 0, 40, 40);
        [imageView setImage:image];
        [self.peopleView addSubview:imageView];
        
        count++;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

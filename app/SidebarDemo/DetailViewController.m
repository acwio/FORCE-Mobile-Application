//
//  DetailViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/1/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "DetailViewController.h"
#import "MeetingTabBarController.h"
#import "SWRevealViewController.h"
#import <MapKit/MapKit.h>

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

@synthesize peopleHeaderLabel;
@synthesize fileHeaderLabel;

@synthesize peopleView;
@synthesize filesView;

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

    
    //stuff for current date
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"EEE MMM dd yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    
    //tomorrow's date
    int daysToAdd = 1;
    NSDate *tomDate = [currDate dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSString *tDate = [dateFormatter stringFromDate:tomDate];
    
    
    //stuff for stored date and time
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE MMM dd yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:meeting.date];
    [formatter setDateFormat:@"HH:mm a"];
    NSString *time = [formatter stringFromDate:meeting.date];
    
    //figure out if the date is today or tomorrow only.
    if([stringFromDate isEqualToString:dateString])
        self.dateLabel.text = @"Today";
    else if ([dateString isEqualToString:tDate])
        self.dateLabel.text = @"Tomorrow";
    else
        self.dateLabel.text = stringFromDate;
    self.timeLabel.text = time;
    
    self.companyLabel.text = meeting.company;
    self.addressLabel.text = meeting.address;
    self.descriptionLabel.text = meeting.description;
        
    if ([meeting.people count] == 0) {
        self.peopleHeaderLabel.text = @"No Attendees";
    } else if([meeting.people count] == 1) {
        self.peopleHeaderLabel.text = @"1 Attendee";
    } else {
        self.peopleHeaderLabel.text = [NSString stringWithFormat:@"%d People Attending", [meeting.people count]];
    }
    
    if ([meeting.files count] == 0) {
        self.fileHeaderLabel.text = @"No Files";
    } else if([meeting.files count] == 1) {
        self.fileHeaderLabel.text = @"1 File";
    } else {
        self.fileHeaderLabel.text = [NSString stringWithFormat:@"%d Files", [meeting.files count]];
    }
    
    
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
    
    [self.peopleView setContentSize:CGSizeMake(40*[meeting.people count], 40)];
    
    // Draw the images of the files
    count = 0;
    for (File *f in meeting.files) {
        UIImage *image;
        
        if ([[f.path pathExtension] isEqualToString:@"jpg"] || [[f.path pathExtension] isEqualToString:@"png"]) {
            image = [UIImage imageNamed:f.path];
        } else if ([[f.path pathExtension] isEqualToString:@"pdf"]) {
            image = [UIImage imageNamed:@"pdf-32.png"];
        } else if ([[f.path pathExtension] isEqualToString:@"txt"]) {
            image = [UIImage imageNamed:@"txt-32.png"];
        } else if ([[f.path pathExtension] isEqualToString:@"aif"]) {
            image = [UIImage imageNamed:@"mp3-100.png"];
        }
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        imageView.frame = CGRectMake(count*40, 0, 40, 40);
        [imageView setImage:image];
        [self.filesView addSubview:imageView];
        
        count++;
    }
    
    [self.filesView setContentSize:CGSizeMake(40*[meeting.files count], 40)];
    
    
}

- (IBAction)mapLocation:(id)sender {
    
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:meeting.location.coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:meeting.company];
        [mapItem openInMapsWithLaunchOptions:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  PersonViewController.m
//  FORCE
//
//  Created by Nathan Reale on 11/4/13.
//  Copyright (c) 2013 Middle Tennessee State University. All rights reserved.
//

#import "PersonViewController.h"
#import "MeetingTabBarController.h"
#import "SWRevealViewController.h"
#import "Meeting.h"
#import "DataClass.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

@synthesize person;

@synthesize meetingsTable;
@synthesize imageView;
@synthesize nameLabel;
@synthesize titleLabel;
@synthesize companyLabel;

NSArray *meetings;


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
    
    nameLabel.text = @"";
    titleLabel.text = @"";
    companyLabel.text = @"";
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self becomeFirstResponder];
    
    [imageView setImage:[UIImage imageNamed:person.picURL]];
    nameLabel.text = person.name;
    titleLabel.text = person.title;
    companyLabel.text = person.company;
    
    meetings = [[DataClass getInstance].meetings filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Meeting *evaluatedObject, NSDictionary *bindings) {
        for (Person *p in evaluatedObject.people) {
            if ([p.name isEqual:person.name]) {
                return true;
            }
        }
        return false;
    }]];
    
    [meetingsTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)phone:(id)sender {
    NSString *phoneNumber = @"1-615-438-0013";
    NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
}

- (IBAction)email:(id)sender {
    NSString *mail = [NSString stringWithFormat:@"ncr2g@mtmail.mtsu.edu"];

    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"mailto://%@",
                                                [mail stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    
    [[UIApplication sharedApplication] openURL:url];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [meetings count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier/* forIndexPath:indexPath*/];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Meeting *meeting = [meetings objectAtIndex:indexPath.row];
    
    cell.textLabel.text = meeting.name;
    
    return cell;
}

// Called when you click on a file
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create a new meeting page, using the identifier defined in Storyboard
    MeetingTabBarController *stubController = [self.storyboard instantiateViewControllerWithIdentifier:@"MeetingTabBar"];
    stubController.view.backgroundColor = [UIColor whiteColor];
    
    Meeting *meet = [meetings objectAtIndex:indexPath.row];
    stubController.title = meet.name;
    stubController.meeting = meet;
    
    // Push the new meeting page on top of the current page
    [(UINavigationController*)self.revealViewController.frontViewController pushViewController:stubController animated:YES];
    
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
